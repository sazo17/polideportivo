-- ------------------------------------------------------------------------------------------------
-- DEPENDENCIAS --
-- Dependencia de `p_jornada` y `p_campeonatos`
ALTER TABLE CAMPEONATO ADD CONSTRAINT cu_nombre UNIQUE(nombre_campeonato);

-- Dependencia de procedimiento `p_jugadores`
ALTER TABLE USUARIOS ADD CONSTRAINT cu_user UNIQUE(user_usuarios);


-- Es necesario realizar esta modificacion en el campo de la tabla
-- Workbench por si solo no permitia definir el tipo de dato `TIMESTAMP`
ALTER TABLE BITACORA_LOGIN MODIFY fecha_bitacora TIMESTAMP;

-- --------------------------------------------------------------------------------------
﻿-- PROCEDIMIENTOS A TABLAS PRINCIPALES --


-- Jugadores --

DELIMITER //	
-- Declaracion de parametros In/Out
CREATE PROCEDURE p_jugadores( IN i_nombre VARCHAR(45), 	IN i_apellidos VARCHAR(45), 
IN i_edad INT(11), 		IN i_direccion VARCHAR(45),	IN i_telefono VARCHAR(12), 
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




-- ENTRENADOR -- 
DELIMITER //												-- Fase BETA
-- Declaracion de parametros In/Out
CREATE PROCEDURE p_entrenadores(
IN i_nombre VARCHAR(45),	IN i_apellidos VARCHAR(45), 
IN i_edad INT(11), 		IN i_direccion VARCHAR(45), 
IN i_telefono VARCHAR(12), 	IN i_mail VARCHAR(45), 
IN i_deporte INT, 		IN i_user VARCHAR(16), 
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


-- ARBITRO --
DELIMITER //	
CREATE PROCEDURE p_arbitros(
IN i_nombre VARCHAR(45),	IN i_apellidos VARCHAR(45),
IN i_edad INT(11), 		IN i_direccion VARCHAR(45), 
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


-- EMPLEADOS -- 
DELIMITER //
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


-- Procedimiento jornadas
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





-- DEPORTE--
delimiter $
create procedure ingresar_deporte (in num_jugadores int, tdeporte int)
begin
	insert into deporte (cantidad_jugadores_deporte,idTipo_Deporte) values (num_jugadores,tdeporte);
end$

-- EQUIPOS --
select * from equipos;
delimiter $
create procedure ingresar_equipo(in nomeq varchar(35), in num_juga int , in idEntre int, in unifor int)
begin
	insert into equipos (nombre_equipo,cantidad_jugadores_equipo,identrenador,UNIFORME_idUniforme)
    values (nomeq,num_juga,identre,unifor);
end$ 

-- CAMPOS-- 
delimiter $
create procedure ingresar_campo(in campo varchar(20), in estado varchar(20),in tipodeport int)
begin
	insert into campos (campo_campos,estado_campos,idTipos_Deporte) values (campo,estado,tipodeport);
end$



-- REGLAS DE FUTBOL -- 
delimiter $
create procedure ingresar_reglas_futbol(in nombre varchar(45), in descripcion varchar(1000),in deporte int)
begin
	insert into reglas_futbol (nombre_reglas_futbol,descripcion_reglas_futbol,DEPORTE_idDeporte)
    values (nombre,descripcion,deporte);
end$

-- REGLAS DE basket -- 
delimiter $
create procedure ingresar_reglas_basket(in nombreb varchar(45), in descripcionb varchar(1000),in deporteb int)
begin
	insert into reglas_basket (nombre_reglas_basket,descripcion_reglas_basket,DEPORTE_idDeporte)
    values (nombreb,descripcionb,deporteb);
end$

-- REGLAS DE VOLI-- 
delimiter $
create procedure ingresar_reglas_voli(in nombrev varchar(45), in descripcionv varchar(1000),in deportev int)
begin
	insert into reglas_voleibol (nombre_reglas_voleibol,descipcion_reglas_voleibol,DEPORTE_idDeporte)
    values (nombrev,descripcionv,deportev);
end$

-- REGLAS BEISBOL --
delimiter $
create procedure ingresar_reglas_beisbol(in nombrebe varchar(45), in descripcionbe varchar(1000),in deportebe int)
begin
	insert into reglas_beisbol(nombre_reglas_beisbol,descripcion_reglas_beisbol,DEPORTE_idDeporte)
    values (nombrebe,descripcionbe,deportebe);
end$