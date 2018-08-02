-- Es necesario realizar esta modificacion en el campo de la tabla
-- Workbench por si solo no permitia definir el tipo de dato `TIMESTAMP`
ALTER TABLE BITACORA_LOGIN MODIFY fecha_bitacora TIMESTAMP;

-- Codigo PL/MySQL 
DELIMITER //									-- Funciona correctamente
-- Definicion de cada uno de los parametros IN parametros que recibe
-- OUT salidas a la aplicacion.
CREATE PROCEDURE p_login(IN user VARCHAR(16)
, IN pass VARCHAR(30)
, OUT o_tipo_usuarios VARCHAR(1) 
, OUT o_estado_usuarios VARCHAR(1)
, OUT o_idUsuarios INT(11)
) 
BEGIN
	-- Declaracion de variables
	DECLARE s_tipo,  s_estado VARCHAR(1);
	DECLARE s_id INT(11);
    	-- Declaracion de Exception
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	SET o_tipo_usuarios = 0, o_estado_usuarios = 0, o_idUsuarios = 0;
        
	-- Busqueda de usuario y contrasenia.
	-- Se asigna en una variable cuando se encuentra.
	SELECT Tipo_usuarios, estado_usuarios, idUsuarios
	INTO s_tipo, s_estado, s_id
	FROM USUARIOS
	WHERE 
		user_usuarios = user AND
		pass_usuarios = pass;
        
	-- Validacion de `s_id` si no es NULL puede proceder
	IF s_id IS NOT NULL THEN
		-- Asignacion de los valores recibidos en las variables
		-- de salida.
		SET o_tipo_usuarios = s_tipo;
		SET o_estado_usuarios = s_estado;
		SET o_idUsuarios = s_id;
        	-- Inserta datos en la `bitacora_login` 
		-- inserta la fecha actual + hora y el host = hostname@puerto
		INSERT INTO BITACORA_LOGIN (usuario_bitacora, 
		fecha_bitacora, host_bitacora) 
		VALUES (s_id, SYSDATE(), USER());
		COMMIT;
	ELSE 
		-- Retonra valores asignados en variables cuando `s_id`es NULL
		SET o_tipo_usuarios = 'N';
		SET o_estado_usuarios = 'N';
		SET o_idUsuarios = 0;				  
    END IF;
END//
DELIMITER ;

-- Ejecutando PL/MySQL para pruebas
CALL p_login('usuario1', '1234', @a, @b, @c);
-- Salida en pantalla de los parametros de `p_login`
SELECT @a, @b, @c;
-- Verificando tabla `Bitacora_Login`
SELECT * FROM BITACORA_LOGIN;


-- --------------------------------------------------------------------------------------------
-- Procedimiento para campeonato
-- Insertando datos en tabla transaccional `p_campeonato`
DELIMITER //									-- Fase BETA
-- Definiendo parametros en `p_campeonato`
CREATE PROCEDURE p_campeonato(IN i_nombre VARCHAR(50),
IN i_fecha_ini DATE, IN i_fecha_fin DATE, IN i_cantidad INT,
IN id_empleado INT, IN tipo_camp VARCHAR(30), IN i_deporte INT(11),
OUT o_bit INT(1))
BEGIN
	-- Declaracion de variables
	DECLARE t_tipo_camp INT;
    DECLARE t_deporte INT;
    DECLARE tDeporte_id INT;
	
	-- Se asignan los valores encontrados a las variables
	SELECT idTipo_campeonato INTO t_tipo_camp 
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = tipo_camp;
	-- ----------
     SELECT idTipo_Deporte INTO tDeporte_id
     FROM DEPORTE
     WHERE idDeporte = i_deporte;
	-- SELECT idTipo_Deporte INTO t_deporte
	-- FROM TIPOS_DEPORTE
	-- WHERE tipo_Tipo_Deporte = i_deporte;
	--
	-- SELECT idDeporte INTO deporte_id
	-- FROM DEPORTE
	-- WHERE idTipo_Deporte = t_deporte;

	-- Validacion de las variables 
	IF tDeporte_id IS NOT NULL AND t_tipo_camp IS NOT NULL THEN
		INSERT INTO CAMPEONATO
		(nombre_campeonato, fecha_inicio_campenato,
		fecha_finalización_campeonato, cantidad_equipos_campeonato,
		idEmpleados, idTipo_campeonato, idDeporte, idTipo_Deporte)
		VALUES (
			i_nombre, i_fecha_ini, i_fecha_fin, i_cantidad, id_empleado,
			t_tipo_camp, tDeporte_id, i_deporte);
		-- Retorna 1 si el procedimiento se desarrollo normalmente.
		SET o_bit = 1;
        COMMIT;
	ELSE 
		-- Retorna 0 si las variables estaban NULL
		SET o_bit = 0;
        ROLLBACK;
	END IF;
END//
DELIMITER ;

-- Solo para pruebas
-- CALL p_campeonato('campeonato1', '2018-08-09', '2017-08-19', 25, 2, 'tipoc_1', 2,@a);
-- SELECT @a;


-- ----------------------------------------------------------------------------------------------
-- Procedimiento registro_jugadores
DELIMITER //										-- Fase BETA
-- Definicion de parametros en `p_jug_registro`
CREATE PROCEDURE p_jug_registro(IN i_fecha_ini DATE, IN i_fecha_fin DATE,
IN i_desc_jugreg VARCHAR(50), IN i_equipo VARCHAR(35), IN i_id_jugador INT,
IN i_posjug INT, OUT o_bit INT(1))
BEGIN
	-- Declaracion de variables
	DECLARE t_equipo INT;
	
    -- Asignacion de valores encontrados
	SELECT idEquipos INTO t_equipo
	FROM EQUIPOS 
	WHERE nombre_equipo = i_equipo;
	-- -----
	-- SELECT id_pogjug INTO t_posjug
	-- FROM POSICION_JUGADOR
	-- WHERE posicion_posicionjugador = i_posjug;
	
    -- Validacion de variables != NULL
	IF t_equipo IS NOT NULL THEN
		INSERT INTO JUGADORES_REGISTRO 
		(fecha_ini_jugadores_registro, fecha_fin_jugadores_registro, 
		descripcion_jugadoresregistro, idEquipos, idJugadores,
		id_pogjug) 
		VALUES (i_fecha_ini, i_fecha_fin, i_desc_jugreg, 
        t_equipo, i_id_jugador,
		i_posjug);
		
		-- Retorna 1 si todo se realizo correctamente
		SET o_bit = 1;
		COMMIT;
	ELSE 
		-- Retorna 0 si no se realizo correctamente
		SET o_bit = 0;
		ROLLBACK;
	END IF;
END//
DELIMITER ;

-- Ejecutando PL/MySQL para pruebas
-- CALL p_jug_registro('2018-01-05', '2019-12-02', '884 94 AKIW', 'equipo1', 105, 1,@a);
-- SELECT @a; 


-- ------------------------------------------------------------------------------------------------
-- Dependencia de procedimiento `p_jugadores`
ALTER TABLE USUARIOS ADD CONSTRAINT cu_user UNIQUE(user_usuarios);

-- Procedimiento jugadores/usuarios
DELIMITER //												-- Fase BETA
-- Declaracion de parametros In/Out
CREATE PROCEDURE p_jugadores( IN i_nombre VARCHAR(45), 	IN i_apellidos VARCHAR(45), 
IN i_edad INT(11), 			IN i_direccion VARCHAR(45),	IN i_telefono VARCHAR(12), 
IN i_mail VARCHAR(45), 		IN i_genero VARCHAR(1), 	IN i_fotografia VARCHAR(45), 
IN i_user VARCHAR(16), 		IN i_pass VARCHAR(30), 		IN i_estado VARCHAR(1),
OUT o_bit INT(1))
BEGIN
	-- Declaracion de variable 
	DECLARE t_iuser, p_iuser INT;
    
    -- Verifica que el usuario no exista.
    SELECT idUsuarios INTO p_iuser
	FROM USUARIOS
	WHERE 
		 user_usuarios = i_user AND pass_usuarios = i_pass;
         
	IF p_iuser IS NULL THEN
		-- Inserccion de usuario
		INSERT INTO USUARIOS (user_usuarios, pass_usuarios, Tipo_usuarios, estado_usuarios)
			VALUES (i_user, i_pass, 'R',i_estado);
		-- Obtiene el id del usuario ingresado
		SELECT idUsuarios INTO t_iuser
		FROM USUARIOS
		WHERE 
			user_usuarios = i_user;
            
		-- Valida si el usuario fue ingresado
		IF i_user IS NOT NULL THEN
			-- Inserccion de datos del Jugador
			INSERT INTO JUGADORES (nombre_jugadores, apellido_jugadores,
			edad_jugadores, dirección_jugadores, telefono_jugadores, email_jugadores,
			genero_jugadores, fotografia_jugadores, idUsuarios)
				VALUES (i_nombre, i_apellidos, i_edad, i_direccion, i_telefono, i_mail,
				i_genero, i_fotografia, t_iuser);
			-- Si todo va bien la salida es 1|commit
			SET o_bit = 1;
			COMMIT;
		ELSE
			-- Si el usuario no fue ingresado la salida es 0
			SET o_bit = 0;
			ROLLBACK;
		END IF;
    ELSE
		SET o_bit = 0;
    END IF;
END//
DELIMITER ;

-- Ejecutando PL/MySQL para pruebas
-- CALL p_jugadores('hey', 'mundo', 15, 'guatemala', 505050, 'correojef', 'M', 'fotografia', 'usuario5', 1246, 1,@a);
-- SELECT @a; 

-- -----------------------------------------------------------------------------------------------------
-- Procedimiento entrenadores/usuarios
DELIMITER //												-- Fase BETA
-- Declaracion de parametros In/Out
CREATE PROCEDURE p_entrenadores(
IN i_nombre VARCHAR(45),	IN i_apellidos VARCHAR(45), 
IN i_edad INT(11), 			IN i_direccion VARCHAR(45), 
IN i_telefono VARCHAR(12), 	IN i_mail VARCHAR(45), 
IN i_deporte INT, 			IN i_user VARCHAR(16), 
IN i_pass VARCHAR(30), 		IN i_estado VARCHAR(1),
OUT o_bit INT(1))
BEGIN
	-- Declaracion de variable 
	DECLARE t_iuser, p_iuser INT;
    
    	-- Verifica que el usuario no exista.
    	SELECT idUsuarios INTO p_iuser
	FROM USUARIOS
	WHERE 
		 user_usuarios = i_user AND pass_usuarios = i_pass;
	IF p_iuser IS NULL THEN
		INSERT INTO USUARIOS (user_usuarios, pass_usuarios, Tipo_usuarios, estado_usuarios)
			VALUES (i_user, i_pass, 'E',i_estado);
		-- Obtiene el id del usuario ingresado
		SELECT idUsuarios INTO t_iuser
		FROM USUARIOS
		WHERE 
			user_usuarios = i_user;
		-- Valida si el usuario fue ingresado
		IF i_user IS NOT NULL THEN
			INSERT INTO ENTRENADORES (nombre_entrenadores, apellido_entrenadores, 
			edad_entrenadores, dirección_entrenadores, telefono_entrenadores, email_entrenadores,
			idDeporte, USUARIOS_idUsuarios)
				VALUES (i_nombre, i_apellidos, i_edad, i_direccion, i_telefono, 
				i_mail, i_deporte, t_iuser);
			SET o_bit = 1;
        ELSE
			SET o_bit = 0;
			ROLLBACK;
        END IF;
	ELSE
		SET o_bit = 3;
    END IF; 
END//
DELIMITER ;

-- Ejecutando PL/MySQL para pruebas
-- CALL p_entrenadores('hey', 'mundo', 15, 'guatemala', 505050, 'correojef', 1, 'usuario6', 1248, 1,@a);
-- SELECT @a;


-- --------------------------------------------------------------------------------------------
-- Procedimiento arbitros/usuarios
DELIMITER //												-- Fase BETA
-- Declaracion de parametros In/Out
CREATE PROCEDURE p_arbitros(
IN i_nombre VARCHAR(45),	IN i_apellidos VARCHAR(45),
IN i_edad INT(11), 			IN i_direccion VARCHAR(45), 
IN i_telefono VARCHAR(12), 	IN i_mail VARCHAR(45), 
IN i_tipoa VARCHAR(25),		IN i_deporte INT,
IN i_user VARCHAR(16), 		IN i_pass VARCHAR(30), 		
IN i_estado VARCHAR(1),		IN i_tipo VARCHAR(1),
OUT o_bit INT(1))
BEGIN
	-- Declaracion de variable 
	DECLARE t_iuser, p_iuser, t_tipo, t_tiopa INT;
    
    -- Verifica que el usuario no exista.
    SELECT idUsuarios INTO p_iuser
	FROM USUARIOS
	WHERE 
		 user_usuarios = i_user AND pass_usuarios = i_pass;
	
    IF p_iuser IS NULL THEN
		INSERT INTO USUARIOS (user_usuarios, pass_usuarios, Tipo_usuarios, estado_usuarios)
			VALUES (i_user, i_pass, i_tipo, i_estado);
			-- Obtiene el id del usuario ingresado
		SELECT idUsuarios INTO t_iuser
		FROM USUARIOS
		WHERE 
			user_usuarios = i_user;
		--
        SELECT idTipo_Deporte INTO t_tipo
        FROM DEPORTE
        WHERE idDeporte = i_deporte;
        SELECT idTipo_Arbitro INTO t_tiopa
        FROM TIPO_ARBITRO
        WHERE tipo_tipo_arbitro = i_tipoa;
        
		IF t_iuser IS NOT NULL 
			AND t_tipo IS NOT NULL 
            AND t_tiopa IS NOT NULL THEN
			INSERT INTO ARBITRO (nombre_arbitro, apellido_arbitro, edad_arbitro,
            direccion_arbitro, telefono_arbitro, email_arbitro, idTipo_Arbitro, 
            idUsuarios, idDeporte, idTipo_Deporte)
				VALUES (i_nombre, i_apellidos, i_edad, i_direccion, i_telefono, i_mail, t_tiopa,
                t_iuser, i_deporte, t_tipo);
			SET o_bit = 1;
		ELSE
			SET o_bit = 3;
        END IF;
	ELSE
		SET o_bit = 0;
    END IF;
END//
DELIMITER ;


-- Ejecutando PL/MySQL para pruebas
-- CALL p_arbitros('hey', 'mundo', 15, 'guatemala', 505050, 'correojef', 'tipoa2', 2, 'usuario8', 1248, 1, 'R',@a);
-- SELECT @a;




-- ---------------------------------------------------------------------------------------
-- Procedimiento empleados/usuarios
DELIMITER //												-- Fase BETA
-- Declaracion de parametros In/Out
CREATE PROCEDURE p_empleados(
IN i_nombre VARCHAR(50),	IN i_apellidos VARCHAR(50),
IN i_edad INT(11), 		IN i_direccion VARCHAR(55), 
IN i_telefono VARCHAR(12), 	IN i_mail VARCHAR(45), 
IN i_area VARCHAR(25),		IN i_puesto VARCHAR(35),
IN i_user VARCHAR(16), 		IN i_pass VARCHAR(30), 		
IN i_estado VARCHAR(1),		IN i_tipo VARCHAR(1),
OUT o_bit INT(1))
BEGIN 
	-- Declaracion de variable 
	DECLARE t_iuser, p_iuser, t_area, t_puesto INT;
	-- Verifica que el usuario no exista.
    	SELECT idUsuarios INTO p_iuser
	FROM USUARIOS
	WHERE 
		 user_usuarios = i_user AND pass_usuarios = i_pass;
	IF p_iuser IS NULL THEN
		INSERT INTO USUARIOS (user_usuarios, pass_usuarios, Tipo_usuarios, estado_usuarios)
			VALUES (i_user, i_pass, i_tipo, i_estado);
			-- Obtiene el id del usuario ingresado
		SELECT idUsuarios INTO t_iuser
		FROM USUARIOS
		WHERE 
			user_usuarios = i_user;
		--
        SELECT idPuesto INTO t_puesto
        FROM PUESTO
        WHERE 
			Nombrepuesto_Puesto = i_puesto;
        SELECT idArea INTO t_area
        FROM AREA
        WHERE 
			nombrearea_area = i_area;
		IF t_iuser IS NOT NULL 
			AND t_puesto IS NOT NULL
            AND t_area IS NOT NULL THEN
			INSERT INTO EMPLEADOS (nombre_empleados, apellido_empleados,
            edad_empleados, dirección_empleados, telefono_empleados, 
            email_empleados, idArea, idPuesto, idUsuarios)
            VALUES (i_nombre, i_apellidos, i_edad, i_direccion, 
            i_telefono, i_mail, t_area, t_puesto, t_iuser);
			SET o_bit = 1;
		ELSE
			SET o_bit = 0;
        END IF;
    ELSE
		SET o_bit = 3;
	END IF;
END//
DELIMITER ;


-- Ejecutando PL/MySQL para pruebas
-- CALL p_empleados('hey', 'mundo', 15, 'guatemala', 505050, 'correojef', 'area2', 'puesto2', 'usuario9', 1248, 1, 'R',@a);
-- SELECT @a;






















-- AUN EN DESARROLLO Y PRUEBAS 
DROP PROCEDURE p_jornada;
USE p_polideportivo;
SELECT * FROM JORNADAS;
DELIMITER //
CREATE PROCEDURE p_jornada(IN fecha_j DATE, 
IN goles_l INT, IN equipo_l VARCHAR(35),
IN goles_v INT, IN equipo_v VARCHAR(35),
IN hora_j TIME, IN  arbitroId INT, 
IN campos_n VARCHAR(20), IN campeonato_n VARCHAR(50),
IN c_tipoDepor_n VARCHAR(35), IN c_tipoCampe_n VARCHAR(30),
IN estado_n VARCHAR(20), IN c_deporte INT,
OUT o_bit INT(1))
BEGIN
	DECLARE equipo_lid, equipo_vid, campo_id, campeonato_id INT;
	DECLARE tipoDepor_id, tipoCampe_id, estado_id, tipoArb_id INT;
	DECLARE deporte_id INT;
	--
    IF equipo_l <> equipo_v THEN
		SELECT idTipo_Arbitro INTO tipoArb_id
		FROM ARBITRO
		WHERE idArbitro = arbitroId;
		--
		SELECT idCampos INTO campo_id
		FROM CAMPOS
		WHERE campo_campos = campos_n;
		--
		SELECT idEquipos INTO equipo_lid
		FROM EQUIPOS
		WHERE nombre_equipo = equipo_l;
	
		SELECT idEquipos INTO equipo_vid
		FROM EQUIPOS
		WHERE nombre_equipo = equipo_v;
		--
		SELECT idEstado_partido INTO estado_id
		FROM ESTADO_PARTIDO
		WHERE Estado_estado_partido = estado_n;
		--
		SELECT idTipo_Deporte INTO tipoDepor_id
		FROM TIPOS_DEPORTE
		WHERE tipo_Tipo_Deporte = c_tipoDepor_n;
	
		-- SELECT idDeporte INTO deporte_id
		-- FROM DEPORTE
		-- WHERE idTipo_Deporte = tipoDepor_id;

		SELECT idTipo_campeonato INTO tipoCampe_id
		FROM TIPO_CAMPEONATO
		WHERE Tipo_Tipo_campeonato = c_tipoCampe_n;

		SELECT idCampeonato INTO campeonato_id
		FROM CAMPEONATO
		WHERE nombre_campeonato = campeonato_n AND idTipo_Deporte = tipoDepor_id AND idTipo_campeonato = tipoCampe_id;
        -- AND C_idDeporte = c_deporte;	
        
        IF tipoArb_id IS NOT NULL AND campo_id IS NOT NULL AND equipo_lid IS NOT NULL AND equipo_vid IS NOT NULL 
		AND estado_id IS NOT NULL AND campeonato_id IS NOT NULL THEN
        
			INSERT INTO JORNADAS (fecha_hora_jornadas, 
			idArbitro, idTipo_Arbitro, A_idDeporte,
			idCampos, idTipos_Deporte, goles_local_jornadas, 
			goles_visita_jornadas, hora_jornadas, 
			idEquipos_local, idEquipos_visita, 
			idCampeonato, idTipo_Deporte, 
			C_idDeporte, idTipo_campeonato,
			idEstado_partido)
			VALUES (fecha_j, arbitroId, 
			tipoArb_id, 1, 1,1, goles_l,
			goles_v, hora_j, equipo_lid, 
			equipo_vid, campeonato_id, tipoDepor_id, c_deporte, tipoCampe_id, estado_id);
			SET o_bit = 1;
		ELSE	
			SET o_bit = 3;
		END IF;
	ELSE 
		SET o_bit = 5;
	END IF;
END//
DELIMITER ;

DESC JORNADAS;
CALL p_jornada('2018-01-12', 2,'Oyoyo', 1, 'Rhynoodle', '09:12:01',1, 'campo1','systemic', 'tipo6', 'tipo_c10', 'estado1', 11,@a);
SELECT @a;


SELECT *
FROM DEPORTE
WHERE idTipo_Deporte = 6;




DELIMITER //
CREATE PROCEDURE p_jornada(IN fecha_j DATE, 
IN goles_l INT, IN equipo_l VARCHAR(35),
IN goles_v INT, IN equipo_v VARCHAR(35),
IN hora_j TIME, IN  arbitroId INT, 
IN campos_n VARCHAR(20), IN campeonato_n VARCHAR(50),
IN c_tipoDepor_n VARCHAR(35), IN c_tipoCampe_n VARCHAR(30),
IN estado_n VARCHAR(20),
OUT bit INT(1))
BEGIN
	DECLARE equipo_lid, equipo_vid, campo_id, campeonato_id INT;
	DECLARE tipoDepor_id, tipoCampe_id, estado_id, tipoArb_id INT;
	DECLARE deporte_id INT;
	--
    IF equipo_l <> equipo_v THEN
		SELECT idTipo_Arbitro INTO tipoArb_id
		FROM ARBITRO
		WHERE idArbitro = arbitroId;
		--
		SELECT idCampos INTO campo_id
		FROM CAMPOS
		WHERE campo_campos = campos_n;
		--
		SELECT idEquipos INTO equipo_lid
		FROM EQUIPOS
		WHERE nombre_equipo = equipo_l;
	
		SELECT idEquipos INTO equipo_vid
		FROM EQUIPOS
		WHERE nombre_equipo = equipo_v;
		--
		SELECT idEstado_partido INTO estado_id
		FROM ESTADO_PARTIDO
		WHERE Estado_estado_partido = estado_n;
		--
		SELECT idTipo_Deporte INTO tipoDepor_id
		FROM TIPOS_DEPORTE
		WHERE tipo_Tipo_Deporte = c_tipoDepor_n;
	
		SELECT idDeporte INTO deporte_id
		FROM DEPORTE
		WHERE idTipo_Deporte = tipoDepor_id;

		SELECT idTipo_campeonato INTO tipoCampe_id
		FROM TIPO_CAMPEONATO
		WHERE Tipo_Tipo_campeonato = c_tipoCampe_n;

		SELECT idCampeonato INTO campeonato_id
		FROM CAMPEONATO
		WHERE nombre_campeonato = campeonato_n;	
		IF tipoArb_id IS NOT NULL AND campo_id IS NOT NULL AND
		equipo_lid IS NOT NULL AND equipo_vid IS NOT NULL AND
		estado_id IS NOT NULL AND campeonato_id IS NOT NULL THEN
			INSERT INTO JORNADAS (fecha_jornadas, 
			idArbitro, idTipo_Arbitro,
			idCampos, goles_local_jornadas, 
			goles_visita_jornadas, hora_jornadas, 
			idEquipos_local, idEquipos_visita, 
			idCampeonato, idTipo_Deporte, 
			idDeporte, idTipo_campeonato,
			idEstado_partido)
			VALUES (fecha_j, arbitroId, 
			tipoArb_id, campo_id, goles_l,
			goles_v, hora_j, equipo_l, 
			equipo_v, campeonato_n, 
			c_tipoDepor_n, c_deporte_n, 
			c_tipoCampe_n, estado_n);
			SET bit = 1;
		ELSE	
			SET bit = 0;
		END IF;
	END IF;
END//
DELIMITER ;




