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