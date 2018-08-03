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


-- ----------------------------------------------------------------------------------------------
-- Procedimiento jornadas
-- Dependencia de `p_jornada` y `p_campeonatos`
ALTER TABLE CAMPEONATO ADD CONSTRAINT cu_nombre UNIQUE(nombre_campeonato);

DELIMITER //
-- Definicion de parametros en `p_jornada`
CREATE PROCEDURE p_jornada(
IN i_fechaJorn DATE,		IN i_campos VARCHAR(20),
IN i_golesL	INT, 			IN i_golesV INT,
IN i_horaJorn TIME,			IN i_equipoL INT,
IN i_equipoV INT,			IN i_campeonato VARCHAR(50),
IN i_deporte INT,	 		IN i_tipoCampeo	VARCHAR(30),
IN i_estadoJorn VARCHAR(20), OUT o_bit INT(1))
BEGIN
	-- Declaracion de variables
	DECLARE t_campos, t_tipoDeporte, t_tipoCampeo, t_campeonato INT;
    DECLARE t_estadoJorn INT;
    --
    -- Asignacion de valores encontrados
    SELECT idCampos INTO t_campos
    FROM CAMPOS
    WHERE campo_campos = i_campos;
    -- 
	SELECT idEstado_partido INTO t_estadoJorn
	FROM ESTADO_PARTIDO
    WHERE Estado_estado_partido = i_estadoJorn;
    -- 
	SELECT idTipo_Deporte INTO t_tipoDeporte
	FROM DEPORTE
	WHERE idDeporte = i_deporte;
    
	SELECT idTipo_campeonato INTO t_tipoCampeo
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = i_tipoCampeo;
     
    SELECT idCampeonato INTO t_campeonato
    FROM CAMPEONATO
    WHERE 
	 	idTipo_campeonato = t_tipoCampeo AND
		idDeporte = i_deporte AND
		idTipo_Deporte = t_tipoDeporte AND
        nombre_campeonato = i_campeonato;
	-- Validacion de variables != NULL 
    -- Validacion de `equipoV` != `equipoL`
	IF i_equipoL <> i_equipoV AND 
	   t_campeonato IS NOT NULL AND
	   t_estadoJorn IS NOT NULL AND 
       t_campos IS NOT NULL 
    THEN
       INSERT INTO JORNADAS (fecha_jornadas, idCampos, 
		goles_local_jornadas, goles_visita_jornadas, 
		hora_jornadas, idEquipos_local, 
		idEquipos_visita, idCampeonato, 
		idTipo_Deporte, idDeporte, 
		idTipo_campeonato, idEstado_partido)
		VALUES (i_fechaJorn, t_campos, 
			i_golesL, i_golesV, 
			i_horaJorn, i_equipoL, 
			i_equipoV, t_campeonato, 
			t_tipoDeporte, i_deporte,
			t_tipoCampeo, t_estadoJorn);
       SET o_bit = 1;
       COMMIT;
	ELSEIF i_equipoL = i_equipoV THEN
		-- Si el los equipos son iguales =>
    	SET o_bit = 3;
	ELSE
		SET o_bit = 0;
        ROLLBACK;
	END IF;
END//
DELIMITER ;

-- Ejecutando PL/MySQL para pruebas
-- CALL p_jornada('2018-08-09', 'campo1', 5, 2, '18:29:34', 3,3, 'campeonato1', 2, 'tipoc_1', 'estado1',@a); -- 'campeonato1', 2, 'tipoc_2', 
-- SELECT @a;

-- ---------------------------------------------------------------------------------------------
-- Procedimiento tabla soccer
DELIMITER //
CREATE PROCEDURE p_tabla_soccer(
IN i_lugar INT, 		IN i_fechaIni DATE, 
IN i_fechaFin DATE, 		IN i_equipo INT,
IN i_campeonato VARCHAR(50),	IN i_deporte INT,
IN i_tipoCampeo	VARCHAR(30), 	OUT o_bit INT(1)) 
BEGIN
	-- Declaracion de variables
	DECLARE t_tipoDeporte, t_tipoCampeo, t_campeonato INT;
    --
	SELECT idTipo_Deporte INTO t_tipoDeporte
	FROM DEPORTE
	WHERE idDeporte = i_deporte;
    
	SELECT idTipo_campeonato INTO t_tipoCampeo
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = i_tipoCampeo;
     
    SELECT idCampeonato INTO t_campeonato
    FROM CAMPEONATO
    WHERE 
	 	idTipo_campeonato = t_tipoCampeo AND
		idDeporte = i_deporte AND
		idTipo_Deporte = t_tipoDeporte AND
        nombre_campeonato = i_campeonato;
	IF t_campeonato IS NOT NULL THEN
		INSERT INTO TABLA_POSICIONES_FUTBOL (
			Lugar_tabla_posiciones_futbol, Fecha_inicio_tabla_posiciones_futbol,
            Fecha_finalizacion_tabla_posiciones_futbol, idEquipos,
            idCampeonato, idTipo_Deporte, idDeporte, idTipo_campeonato
        ) VALUE(i_lugar, i_fechaIni, i_fechaFin, i_equipo,
			t_campeonato, t_tipoDeporte, i_deporte, t_tipoCampeo);
		SET o_bit = 1;
        COMMIT;
	ELSE
		SET o_bit = 0;
		ROLLBACK;
    END IF;
END//
DELIMITER ;
-- ----------------------------------------------------------
-- Procedimiento basket
-- -------------------------------------------------------
-- Dependencias
ALTER TABLE TABLAS_POSICIONES_BASKET 
	MODIFY partidos_jugados_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY partidos_ganados_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY partidos_perdidos_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY partidos_empatados_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY puntos_a_favor_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
	MODIFY puntos_en_contra_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY Diferencia_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY puntos_tablas_posiciones_basket INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_BASKET 
    MODIFY puntos_tablas_posiciones_basket INT DEFAULT 0;
-- ------------------------------------------------------
-- CALL p_tabla_basket(1, '2018-08-09', '2018-10-05', 5, 'campeonato1', 2, 'tipoc_1', @a); 
-- SELECT @a;

DROP PROCEDURE p_tabla_basket;
DELIMITER //
CREATE PROCEDURE p_tabla_basket(
IN i_lugar INT, 				IN i_fechaIni DATE, 
IN i_fechaFin DATE, 			IN i_equipo INT,
IN i_campeonato VARCHAR(50),	IN i_deporte INT,
IN i_tipoCampeo	VARCHAR(30), 	OUT o_bit INT(1))
BEGIN
	-- Declaracion de variables
	DECLARE t_tipoDeporte, t_tipoCampeo, t_campeonato INT;
    --
	SELECT idTipo_Deporte INTO t_tipoDeporte
	FROM DEPORTE
	WHERE idDeporte = i_deporte;
    
	SELECT idTipo_campeonato INTO t_tipoCampeo
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = i_tipoCampeo;
     
    SELECT idCampeonato INTO t_campeonato
    FROM CAMPEONATO
    WHERE 
	 	idTipo_campeonato = t_tipoCampeo AND
		idDeporte = i_deporte AND
		idTipo_Deporte = t_tipoDeporte AND
        nombre_campeonato = i_campeonato;
        
	IF t_campeonato IS NOT NULL THEN
		INSERT INTO TABLAS_POSICIONES_BASKET (
        lugar_tabla_posiciones_basket, Fecha_inicio_tablas_posiciones_basket,
        Fecha_fin_tablas_posiciones_basket, idEquipos,
        idCampeonato, idTipo_Deporte,
        idDeporte, idTipo_campeonato)
        VALUES (i_lugar, i_fechaIni, i_fechaFin, i_equipo,
			t_campeonato, t_tipoDeporte, i_deporte, t_tipoCampeo);
		SET o_bit = 1;
        COMMIT;
	ELSE
		SET o_bit = 0;
    END IF;
END//
DELIMITER ;


-- ----------------------------------------------------------------------------------
-- Procedimiento voleibol
-- -----------------------------------------------------
-- Dependencias
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	MODIFY partidos_jugados_tabla_posiciones_voleibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
		MODIFY partidos_ganados_tabla_posiciones_voleibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY partidos_perdidos_tabla_posiciones_voleibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY set_perdidos_tabla_posiciones_voleibol  INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY set_ganados_tabla_posiciones_voleibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY puntos_afavor_tabla_posiciones_voleibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY puntos_encontra_tabla_posiciones_voleibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY diferencia_puntos_tabla_posiciones_volibol INT DEFAULT 0;
ALTER TABLE TABLAS_POSICIONES_VOLEIBOL 
	    MODIFY puntos_tabla_posiciones_voleibol INT DEFAULT 0;
-- -----------------------------------------------------
-- CALL p_tabla_voleibol(1, 5, 'campeonato1', 2, 'tipoc_1', @a); -- 'campeonato1', 2, 'tipoc_2', 
-- SELECT @a;

DELIMITER //
CREATE PROCEDURE p_tabla_voleibol(
IN i_lugar INT,					IN i_equipo INT,
IN i_campeonato VARCHAR(50),	IN i_deporte INT,
IN i_tipoCampeo	VARCHAR(30), 	OUT o_bit INT(1))
BEGIN
	-- Declaracion de variables
	DECLARE t_tipoDeporte, t_tipoCampeo, t_campeonato INT;
    --
	SELECT idTipo_Deporte INTO t_tipoDeporte
	FROM DEPORTE
	WHERE idDeporte = i_deporte;
    
	SELECT idTipo_campeonato INTO t_tipoCampeo
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = i_tipoCampeo;
     
    SELECT idCampeonato INTO t_campeonato
    FROM CAMPEONATO
    WHERE 
	 	idTipo_campeonato = t_tipoCampeo AND
		idDeporte = i_deporte AND
		idTipo_Deporte = t_tipoDeporte AND
        nombre_campeonato = i_campeonato;
    
    IF t_campeonato IS NOT NULL THEN
		INSERT INTO TABLAS_POSICIONES_VOLEIBOL (
        lugar_tabla_posiciones_voleibol, idEquipos, idCampeonato,
        idTipo_Deporte, idDeporte, idTipo_campeonato)
			VALUES (i_lugar, i_equipo, t_campeonato, 
			t_tipoDeporte, i_deporte, t_tipoCampeo);
		SET o_bit = 1;
        COMMIT;
	ELSE
		SET o_bit = 0;
    END IF;
END//
DELIMITER ;


-- ----------------------------------------------------------------
-- Procedimientos Beisbol
-- ------------------------------------------------------
-- Dependencias
ALTER TABLE TABLA_POSICIONES_BEISBOL
	MODIFY juegos_jugados_tabla_posiciones_beisbol INT DEFAULT 0;
ALTER TABLE TABLA_POSICIONES_BEISBOL
	    MODIFY juegos_ganados_tabla_posiciones_beisbol INT DEFAULT 0;
ALTER TABLE TABLA_POSICIONES_BEISBOL
	    MODIFY juegos_perdidos_tabla_posiciones_beisbol INT DEFAULT 0;
ALTER TABLE TABLA_POSICIONES_BEISBOL
	    MODIFY pct_tabla_posiciones_beisbol DECIMAL(10,0) DEFAULT 0;
ALTER TABLE TABLA_POSICIONES_BEISBOL
	    MODIFY puntos_tabla_posiciones_beisbol INT DEFAULT 0;
ALTER TABLE TABLA_POSICIONES_BEISBOL
	MODIFY racha_tabla_posiciones_beisbol VARCHAR(16) DEFAULT 'NO DEFINE';
ALTER TABLE TABLA_POSICIONES_BEISBOL
	MODIFY casa_tabla_posiciones_beisbol VARCHAR(16) DEFAULT 'NO DEFINE';
ALTER TABLE TABLA_POSICIONES_BEISBOL
	MODIFY ruta_tabla_posiciones_beisbol VARCHAR(16) DEFAULT 'NO DEFINE';
-- ------------------------------------------------------
CALL p_tabla_beisbol(1, 5, 'campeonato1', 2, 'tipoc_1', @a); -- 'campeonato1', 2, 'tipoc_2', 
SELECT @a;

DELIMITER //
CREATE PROCEDURE p_tabla_beisbol(
IN i_lugar INT,					IN i_equipo INT,
IN i_campeonato VARCHAR(50),	IN i_deporte INT,
IN i_tipoCampeo	VARCHAR(30), 	OUT o_bit INT(1))
BEGIN
	-- Declaracion de variables
	DECLARE t_tipoDeporte, t_tipoCampeo, t_campeonato INT;
    --
	SELECT idTipo_Deporte INTO t_tipoDeporte
	FROM DEPORTE
	WHERE idDeporte = i_deporte;
    
	SELECT idTipo_campeonato INTO t_tipoCampeo
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = i_tipoCampeo;
     
    SELECT idCampeonato INTO t_campeonato
    FROM CAMPEONATO
    WHERE 
	 	idTipo_campeonato = t_tipoCampeo AND
		idDeporte = i_deporte AND
		idTipo_Deporte = t_tipoDeporte AND
        nombre_campeonato = i_campeonato;
    
    IF t_campeonato IS NOT NULL THEN
		INSERT INTO TABLA_POSICIONES_BEISBOL(
        lugar_tabla_posiciones_beisbol, idEquipos, idCampeonato,
        idTipo_Deporte, idDeporte, idTipo_campeonato) 
        VALUES (i_lugar, i_equipo, t_campeonato, 
			t_tipoDeporte, i_deporte, t_tipoCampeo);
		SET o_bit = 1;
        COMMIT;
	ELSE
		SET o_bit = 0;
	END IF; 
END//
DELIMITER ;















-- AUN EN DESARROLLO Y PRUEBAS 




