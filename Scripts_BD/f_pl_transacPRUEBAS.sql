USE p_polideportivo;
-- DROP PROCEDURE p_campeonato;

-- Procedimiento para campeonato
DELIMITER //
CREATE PROCEDURE p_campeonato(IN nombre VARCHAR(50),
IN fecha_ini DATE, IN fecha_fin DATE, IN cantidad INT,
IN id_empleado INT, IN tipo_camp VARCHAR(30), IN deporte VARCHAR(35),
OUT bit INT(1))
BEGIN
	DECLARE t_tipo_camp INT;
	DECLARE t_deporte INT;
	DECLARE deporte_id INT;
	
	SELECT idTipo_campeonato INTO t_tipo_camp 
	FROM TIPO_CAMPEONATO
	WHERE Tipo_Tipo_campeonato = tipo_camp;
	-- ----------
	SELECT idTipo_Deporte INTO t_deporte
	FROM TIPOS_DEPORTE
	WHERE tipo_Tipo_Deporte = deporte;
	--
	SELECT idDeporte INTO deporte_id
	FROM DEPORTE
	WHERE idTipo_Deporte = t_deporte;
	IF deporte_id IS NOT NULL AND t_tipo_camp IS NOT NULL THEN
		INSERT INTO CAMPEONATO
		(nombre_campeonato, fecha_inicio_campenato,
		fecha_finalización_campeonato, cantidad_equipos_campeonato,
		idEmpleados, idTipo_campeonato, idDeporte, idTipo_Deporte)
		VALUES (
			nombre, fecha_ini, fecha_fin, cantidad, id_empleado,
			t_tipo_camp, deporte_id, t_deporte);
		SET BIT = 1;
        COMMIT;
	ELSE 
		SET BIT = 0;
        ROLLBACK;
	END IF;
END//
DELIMITER ;

-- CALL p_campeonato('campeonato12', '2018-08-09', '2017-08-19', 25, 35, 'tipo_c11', 'tipo1',@a);
-- SELECT @a;

-- Procedimiento registro_jugadores
DELIMITER //
CREATE PROCEDURE p_jug_registro(IN fecha_ini DATE, IN fecha_fin DATE,
IN desc_jugreg VARCHAR(50), IN equipo VARCHAR(35), IN id_jugador INT,
IN posjug INT, OUT bit INT(1))
BEGIN
	DECLARE t_equipo INT;
	DECLARE t_posjug INT;
	
	SELECT idEquipos INTO t_equipo
	FROM EQUIPOS 
	WHERE nombre_equipo = equipo;
	-- -----
	SELECT id_pogjug INTO t_posjug
	FROM POSICION_JUGADOR
	WHERE posicion_posicionjugador = posjug;
	
	IF t_equipo IS NOT NULL AND t_posjug IS NOT NULL THEN
		INSERT INTO JUGADORES_REGISTRO 
		(fecha_ini_jugadores_registro, fecha_fin_jugadores_registro, 
		descripcion_jugadoresregistro, idEquipos, idJugadores,
		idpogjug) 
		VALUES (fecha_ini, fecha_fin, desc_jugreg, t_equipo, id_jugador,
			t_posjug);
		SET bit = 1;
		COMMIT;
	ELSE 
		SET bit = 0;
		ROLLBACK;
	END IF;
END//
DELIMITER ;


-- DROP PROCEDURE p_jug_registro;
-- CALL p_jug_registro('2018-01-05', '2019-12-02', '884 94 AKIW', 'Jabbercube', 159, @a);
-- SELECT @a; 

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



