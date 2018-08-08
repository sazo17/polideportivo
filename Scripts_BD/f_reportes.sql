use p_polideportivo1;
select * from TABLA_POSICIONES_FUTBOL;
select * from CAMPEONATO;
-- Equipos de cada campeonato
	-- Futbol
    SELECT eq.nombre_equipo AS 'Equipo', cp.nombre_campeonato AS 'Campeonato'
    FROM TABLA_POSICIONES_FUTBOL tpf
    INNER JOIN EQUIPOS eq 		ON eq.idEquipos = tpf.idEquipos
    INNER JOIN CAMPEONATO cp 	ON cp.idCampeonato = tpf.idCampeonato
    -- WHERE 
    -- 		cp.idCampeonato = 
    ORDER BY 1;
    
    -- Basket
    SELECT eq.nombre_equipo AS 'Equipo', cp.nombre_campeonato AS 'Campeonato'
    FROM TABLAS_POSICIONES_BASKET tpb
    INNER JOIN EQUIPOS eq 		ON eq.idEquipos = tpb.idEquipos
    INNER JOIN CAMPEONATO cp 	ON cp.idCampeonato = tpb.idCampeonato
    -- WHERE 
	-- 		cp.idCampeonato = 
    ORDER BY 1;
    
    -- Voleibol 
    SELECT eq.nombre_equipo AS 'Equipo', cp.nombre_campeonato AS 'Campeonato'
    FROM TABLAS_POSICIONES_VOLEIBOL tpv
    INNER JOIN EQUIPOS eq 		ON eq.idEquipos = tpv.idEquipos
    INNER JOIN CAMPEONATO cp 	ON cp.idCampeonato = tpv.idCampeonato
    -- WHERE 
	-- 		cp.idCampeonato = 
    ORDER BY 1;
    
    -- Veisbol
    SELECT eq.nombre_equipo AS 'Equipo', cp.nombre_campeonato AS 'Campeonato'
    FROM TABLA_POSICIONES_BEISBOL tpbe
    INNER JOIN EQUIPOS eq 		ON eq.idEquipos = tpbe.idEquipos
    INNER JOIN CAMPEONATO cp 	ON cp.idCampeonato = tpbe.idCampeonato
    -- WHERE 
	-- 		cp.idCampeonato = 
    ORDER BY 1;
    
-- Jugadores de cada equipo
CREATE VIEW Vjugador_reg_rep AS 
SELECT jg.idJugadores AS 'id_jug', 
CONCAT(jg.nombre_jugadores," ", jg.apellido_jugadores) AS 'nombre', 
jg.fotografia_jugadores AS 'fotografia',
eq.idEquipos AS 'id_eq',eq.nombre_equipo AS 'equipo', 
DATE_FORMAT(jr.fecha_ini_jugadores_registro, '%d/%m/%Y') AS 'fech_ini',
DATE_FORMAT(jr.fecha_ini_jugadores_registro, '%m') AS 'mes_ini',
DATE_FORMAT(jr.fecha_ini_jugadores_registro, '%Y') AS 'year_ini',
DATE_FORMAT(jr.fecha_fin_jugadores_registro, '%d/%m/%Y') AS 'fecha_fin',
DATE_FORMAT(jr.fecha_fin_jugadores_registro, '%m') AS  'mes_fin',
DATE_FORMAT(jr.fecha_fin_jugadores_registro, '%Y') AS 'year_fin'
FROM JUGADORES_REGISTRO jr
INNER JOIN EQUIPOS eq 
	ON jr.idEquipos = eq.idEquipos
INNER JOIN JUGADORES jg 
	ON jr.idJugadores = jg.idJugadores;

	-- INTEGRANTES DE CADA EQUIPO
	SELECT id_jug AS 'Id', nombre AS 'Jugador', 
		fotografia, 
		equipo AS 'Equipo' 
		FROM Vjugador_reg_rep
		-- WHERE equipo = "Brainverse"
		ORDER BY 4;

	-- Movimientos de jugadores entre equipos
		SELECT id_jug AS 'Id', nombre AS 'Jugador',
        fotografia, 
		equipo AS 'Equipo',
        fech_ini AS 'Fecha Inicio', 
        fecha_fin AS 'Fecha Fin'
		FROM Vjugador_reg_rep
        -- WHERE 
		-- 	year_ini = 2018
        ORDER BY 5;

-- Datos personales de cada jugador
SELECT -- jg.idJugadores AS "Id",
CONCAT(jg.nombre_jugadores," ", jg.apellido_jugadores) AS 'Nombre',
jg.edad_jugadores AS 'Edad', 
jg.dirección_jugadores AS 'Direccion',
jg.telefono_jugadores AS 'Telefono',
jg.email_jugadores AS 'Email',
jg.genero_jugadores AS 'Genero',
jg.fotografia_jugadores
FROM JUGADORES jg;


-- Tabla de posiciones de campoenato
	-- FUTBOL
		SELECT tpf.Lugar_tabla_posiciones_futbol AS 'Lugar',
		eq.nombre_equipo AS 'Equipo',
		cmp.nombre_campeonato AS 'Campeonato',
		tpf.partidos_jugados_tabla_posiciones_futbol AS 'PJ',
		tpf.partidos_ganados_tabla_posiciones_futbol AS 'PG',
		tpf.partidos_empatados_tabla_posiciones_futbol AS 'PE',
		tpf.partidos_perdidos_tabla_posiciones_futbol AS 'PP',
		tpf.goles_a_favor_tabla_posiciones_futbol AS 'GF',
		tpf.goles_en_contra_tabla_posiciones_futbol AS 'GC',
		tpf.Diferencia_goles_tabla_posiciones_futbol AS 'DG',
		tpf.Puntos_tabla_posiciones_futbol AS 'Puntos'
		FROM TABLA_POSICIONES_FUTBOL tpf
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpf.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpf.idCampeonato AND
			   cmp.idTipo_campeonato = tpf.idTipo_campeonato AND
			   cmp.idDeporte = tpf.idDeporte AND
			   cmp.idTipo_Deporte = tpf.idTipo_Deporte
		-- WHERE 
		-- 		cmp.nombre_campeonato = 'campeonato2'
        -- ORDER BY 1
        ;
        
		-- BASKET
		SELECT tpb.lugar_tabla_posiciones_basket AS 'Lugar',
		eq.nombre_equipo AS 'Equipo',
		cmp.nombre_campeonato AS 'Campeonato',
        tpb.partidos_jugados_tablas_posiciones_basket AS 'PJ',
        tpb.partidos_ganados_tablas_posiciones_basket AS 'PG',
        tpb.partidos_empatados_tablas_posiciones_basket AS 'PE',
        tpb.partidos_perdidos_tablas_posiciones_basket AS 'PP',
        tpb.puntos_a_favor_tablas_posiciones_basket AS 'PF',
        tpb.puntos_en_contra_tablas_posiciones_basket AS 'PC',
        tpb.puntos_tablas_posiciones_basket AS 'Puntos'
		FROM TABLAS_POSICIONES_BASKET tpb
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpb.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpb.idCampeonato AND
			   cmp.idTipo_campeonato = tpb.idTipo_campeonato AND
			   cmp.idDeporte = tpb.idDeporte AND
			   cmp.idTipo_Deporte = tpb.idTipo_Deporte
		-- WHERE 
		-- 		cmp.nombre_campeonato = 'campeonato2'
        -- ORDER BY 1
        ;

	-- VOLEIBOL
		SELECT tpv.lugar_tabla_posiciones_voleibol AS 'Lugar',
        eq.nombre_equipo AS 'Equipo',
		cmp.nombre_campeonato AS 'Campeonato',
        tpv.partidos_jugados_tabla_posiciones_voleibol AS 'PJ',
        tpv.partidos_ganados_tabla_posiciones_voleibol AS 'PG',
        tpv.partidos_perdidos_tabla_posiciones_voleibol AS 'PP',
        tpv.set_ganados_tabla_posiciones_voleibol AS 'SG',
        tpv.set_perdidos_tabla_posiciones_voleibol AS 'SP',
        tpv.puntos_afavor_tabla_posiciones_voleibol AS 'PA',
        tpv.puntos_encontra_tabla_posiciones_voleibol AS 'PE',
        tpv.diferencia_puntos_tabla_posiciones_volibol AS 'DP',
        tpv.puntos_tabla_posiciones_voleibol AS 'Puntos'
		FROM TABLAS_POSICIONES_VOLEIBOL tpv
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpv.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpv.idCampeonato AND
			   cmp.idTipo_campeonato = tpv.idTipo_campeonato AND
			   cmp.idDeporte = tpv.idDeporte AND
			   cmp.idTipo_Deporte = tpv.idTipo_Deporte
        -- WHERE 
		-- 		cmp.nombre_campeonato = 'campeonato2'
        -- ORDER BY 1
        ;

	-- BEISBOL
		SELECT tpb.lugar_tabla_posiciones_beisbol AS 'Lugar',
		eq.nombre_equipo AS 'Equipo',
		cmp.nombre_campeonato AS 'Campeonato',
        tpb.juegos_jugados_tabla_posiciones_beisbol AS 'JJ',
        tpb.juegos_ganados_tabla_posiciones_beisbol AS 'JG',
        tpb.juegos_perdidos_tabla_posiciones_beisbol AS 'JP',
        tpb.pct_tabla_posiciones_beisbol AS 'PCT',
        tpb.racha_tabla_posiciones_beisbol AS 'Racha',
        tpb.casa_tabla_posiciones_beisbol AS 'Casa',
        tpb.ruta_tabla_posiciones_beisbol AS 'Ruta',
        tpb.puntos_tabla_posiciones_beisbol AS 'Puntos'
        FROM TABLA_POSICIONES_BEISBOL tpb
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpb.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpb.idCampeonato AND
			   cmp.idTipo_campeonato = tpb.idTipo_campeonato AND
			   cmp.idDeporte = tpb.idDeporte AND
			   cmp.idTipo_Deporte = tpb.idTipo_Deporte
		-- WHERE 
		-- 		cmp.nombre_campeonato = 'campeonato2'
        -- ORDER BY 1
        ;


-- Goleadores
	-- Maximo Goleador
	SELECT  
	jr.idJugadores 'Jugador', 
	CONCAT(jg.nombre_jugadores," ",jg.apellido_jugadores) AS 'Juegador',
	SUM(arj.puntos_anotaciones_registro_jugadores) AS 'Goles'
	FROM ANOTACIONES_REGISTRO_JUGADORES arj
	INNER JOIN JUGADORES_REGISTRO jr 	ON jr.id_jugreg = arj.id_jugreg
	INNER JOIN JUGADORES jg 			ON jg.idJugadores = jr.idJugadores
    INNER JOIN TIPOS_DEPORTE td			ON td.idTipo_Deporte = arj.idTipo_Deporte
	-- WHERE
	-- 	 td.tipo_Tipo_Deporte = 'tdeporte_2'
	GROUP BY 1
	HAVING 
		SUM(arj.puntos_anotaciones_registro_jugadores) = (
			SELECT SUM(arj1.puntos_anotaciones_registro_jugadores)
			FROM ANOTACIONES_REGISTRO_JUGADORES arj1
			GROUP BY arj1.id_jugreg
			ORDER BY 1 DESC
			LIMIT 1)
	ORDER BY 3 DESC;
    -- jr.id_jugreg AS 'Id',
    
    -- Maximos Goleadores
	SELECT  
	jr.idJugadores 'Jugador', 
	CONCAT(jg.nombre_jugadores," ",jg.apellido_jugadores) AS 'Jugador',
	SUM(arj.puntos_anotaciones_registro_jugadores) AS 'Goles'
	FROM ANOTACIONES_REGISTRO_JUGADORES arj
	INNER JOIN JUGADORES_REGISTRO jr 	ON jr.id_jugreg = arj.id_jugreg
	INNER JOIN JUGADORES jg 			ON jg.idJugadores = jr.idJugadores
    INNER JOIN TIPOS_DEPORTE td			ON td.idTipo_Deporte = arj.idTipo_Deporte
	-- WHERE
	-- 	td.tipo_Tipo_Deporte = 'tdeporte_2'
	GROUP BY 1
	ORDER BY 3 DESC
    LIMIT 3;

-- Jugador con más tarjetas rojas/Amarillas
SELECT jr.id_jugreg,	
CONCAT(jg.nombre_jugadores," ",jg.apellido_jugadores) AS 'Jugador',
SUM(arj.puntos_amonestaciones_registro_jugadores) AS 'Amonestaciones',
ta.clase_tipo_amonestaciones AS 'Tarjeta' 
FROM AMONESTACIONES_REGISTRO_JUGADORES arj
INNER JOIN JUGADORES_REGISTRO jr 	ON jr.id_jugreg = arj.id_jugreg
INNER JOIN JUGADORES jg 			ON jg.idJugadores = jr.idJugadores
INNER JOIN TIPOS_DEPORTE td			ON td.idTipo_Deporte = arj.idTipo_Deporte
INNER JOIN TIPO_AMONESTACIONES ta	ON ta.idtipo_amonestaciones = arj.idtipo_amonestaciones
	-- WHERE
    -- 	ta.clase_tipo_amonestaciones = 'Amarilla'
	-- 	AND td.tipo_Tipo_Deporte = 'tdeporte_2'
GROUP BY 1
	HAVING 
		SUM(arj.puntos_amonestaciones_registro_jugadores) = (
			SELECT SUM(arj1.puntos_amonestaciones_registro_jugadores)
			FROM AMONESTACIONES_REGISTRO_JUGADORES arj1
			GROUP BY arj1.id_jugreg
			ORDER BY 1 DESC
			LIMIT 1)
ORDER BY 3 DESC;

-- Jugadores con más tarjetas rojas/Amarillas    
SELECT jr.id_jugreg,	
CONCAT(jg.nombre_jugadores," ",jg.apellido_jugadores) AS 'Jugador',
SUM(arj.puntos_amonestaciones_registro_jugadores) AS 'Amonestaciones',
ta.clase_tipo_amonestaciones AS 'Tarjeta' 
FROM AMONESTACIONES_REGISTRO_JUGADORES arj
INNER JOIN JUGADORES_REGISTRO jr 	ON jr.id_jugreg = arj.id_jugreg
INNER JOIN JUGADORES jg 			ON jg.idJugadores = jr.idJugadores
INNER JOIN TIPOS_DEPORTE td			ON td.idTipo_Deporte = arj.idTipo_Deporte
INNER JOIN TIPO_AMONESTACIONES ta	ON ta.idtipo_amonestaciones = arj.idtipo_amonestaciones
	-- WHERE
    -- 	ta.clase_tipo_amonestaciones = 'Amarilla'
	-- 	AND td.tipo_Tipo_Deporte = 'tdeporte_2'
GROUP BY 1
ORDER BY 3 DESC
LIMIT 5;
    






-- Portero menos vencido
SELECT jr.id_pogjug, jug.nombre_jugadores, eq.nombre_equipo
FROM JUGADORES_REGISTRO jr
INNER JOIN JUGADORES jug 	ON jug.idJugadores = jr.idJugadores
INNER JOIN EQUIPOS eq 		ON jr.idEquipos = eq.idEquipos
INNER JOIN TABLA_POSICIONES_FUTBOL tpf ON jr.idEquipos = tpf.idEquipos 
WHERE 
	jr.id_pogjug = 3
    -- AND (SELECT MIN(tpf.goles_en_contra_tabla_posiciones_futbol) 
    --     FROM TABLA_POSICIONES_FUTBOL tpf WHERE )
;


SELECT tpf.goles_en_contra_tabla_posiciones_futbol, 
eq.nombre_equipo, jr.idJugadores
FROM TABLA_POSICIONES_FUTBOL tpf
INNER JOIN EQUIPOS eq ON eq.idEquipos  = tpf.idEquipos
INNER JOIN JUGADORES_REGISTRO jr ON jr.idEquipos = tpf.idEquipos
-- INNER JOIN JUGADORES jug ON jug.idJugadores = jr.idJugadores
WHERE 
	tpf.goles_en_contra_tabla_posiciones_futbol = 
		(SELECT MIN(tpf.goles_en_contra_tabla_posiciones_futbol) 
        FROM TABLA_POSICIONES_FUTBOL tpf)
-- 	AND  jr.id_pogjug = 3
;
SELECT * FROM JUGADORES_REGISTRO;
SELECT * FROM POSICION_JUGADOR;
SELECT * FROM EQUIPOS;
SELECT * FROM JUGADORES;











-- Resultado de los partidos
SELECT eq.nombre_equipo, jr.goles_local_jornadas, jr.goles_visita_jornadas 
FROM JORNADAS jr 
INNER JOIN EQUIPOS eq ON eq.idEquipos = jr.idEquipos_local
INNER JOIN EQUIPOS eq1 ON eq.idEquipos = jr.idEquipos_visita;
--  AND eq.idEquipos = jr.idEquipos_visita

SELECT * FROM JORNADAS;
SELECT * FROM EQUIPOS;
SELECT * FROM CAMPEONATO;






-- SELECT CONCAT(jg.nombre_jugadores, " ", jg.apellido_jugadores) AS 'Jugador',
-- eq.nombre_equipo AS 'Equipo'
-- FROM JUGADORES_REGISTRO jr
-- INNER JOIN JUGADORES jg ON jg.idJugadores = jr.idJugadores
-- INNER JOIN EQUIPOS eq 	ON eq.idEquipos = jr.idEquipos
-- ORDER BY 1;