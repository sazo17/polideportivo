-- Movimientos de jugadores entre equipos
CREATE VIEW Vjugador_reg_rep AS 
SELECT jg.idJugadores AS "id_jug", 
CONCAT(jg.nombre_jugadores," ", jg.apellido_jugadores) AS "nombre", 
jg.fotografia_jugadores AS "fotografia",
eq.idEquipos AS "id_eq",eq.nombre_equipo AS "equipo", 
DATE_FORMAT(jr.fecha_ini_jugadores_registro, '%d/%m/%Y') AS "fech_ini",
DATE_FORMAT(jr.fecha_ini_jugadores_registro, '%m') AS "mes_ini",
DATE_FORMAT(jr.fecha_ini_jugadores_registro, '%Y') AS "year_ini",
DATE_FORMAT(jr.fecha_fin_jugadores_registro, '%d/%m/%Y') AS "fecha_fin",
DATE_FORMAT(jr.fecha_fin_jugadores_registro, '%m') AS "mes_fin",
DATE_FORMAT(jr.fecha_fin_jugadores_registro, '%Y') AS "year_fin"
FROM JUGADORES_REGISTRO jr
INNER JOIN EQUIPOS eq 
	ON jr.idEquipos = eq.idEquipos
INNER JOIN JUGADORES jg 
	ON jr.idJugadores = jg.idJugadores;

    -- INTEGRANTES DE CADA EQUIPO
		SELECT id_jug AS "Id", nombre AS "Jugador", 
		fotografia, 
		equipo AS "Equipo" 
		FROM Vjugador_reg
		-- WHERE equipo = "Brainverse"
		ORDER BY 4;
	
	-- Movimientos de jugadores entre equipos
		SELECT id_jug AS "Id", nombre AS "Jugador",
        fotografia, 
		equipo AS "Equipo",
        fech_ini AS "Fecha Inicio", 
        fecha_fin AS "Fecha Fin"
		FROM Vjugador_reg
        -- WHERE 
		-- 	year_ini = 2018
        ORDER BY 5;

-- Datos personales de cada jugador
SELECT 
-- jg.idJugadores AS "Id",
CONCAT(jg.nombre_jugadores," ", jg.apellido_jugadores) AS "Nombre",
jg.edad_jugadores AS "Edad", 
jg.dirección_jugadores AS "Direccion",
jg.telefono_jugadores AS "Telefono",
jg.email_jugadores AS "Email",
jg.genero_jugadores AS "Genero",
jg.fotografia_jugadores
FROM JUGADORES jg;



-- Equipos de cada campeonato
	-- FUTBOL
		SELECT 
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato"
		FROM TABLA_POSICIONES_FUTBOL tpf
		INNER JOIN CAMPEONATO cmp 
			ON cmp.idCampeonato = tpf.idCampeonato AND
			   cmp.idTipo_campeonato = tpf.idTipo_campeonato AND
			   cmp.idDeporte = tpf.idDeporte AND
			   cmp.idTipo_Deporte = tpf.idTipo_Deporte
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpf.idEquipos
		-- WHERE 
		-- 	cmp.idCampeonato = 4
		ORDER BY 1;
        
        
	-- BASKET
    	SELECT 
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato"
		FROM TABLAS_POSICIONES_BASKET tpb
		INNER JOIN CAMPEONATO cmp 
			ON cmp.idCampeonato = tpb.idCampeonato AND
			   cmp.idTipo_campeonato = tpb.idTipo_campeonato AND
			   cmp.idDeporte = tpb.idDeporte AND
			   cmp.idTipo_Deporte = tpb.idTipo_Deporte
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpb.idEquipos
		-- WHERE 
		-- 	cmp.idCampeonato = 4
		ORDER BY 1;
    
	-- VOLEIBOL
    	SELECT 
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato"
		FROM TABLA_POSICIONES_BEISBOL tpb
		INNER JOIN CAMPEONATO cmp 
			ON cmp.idCampeonato = tpb.idCampeonato AND
			   cmp.idTipo_campeonato = tpb.idTipo_campeonato AND
			   cmp.idDeporte = tpb.idDeporte AND
			   cmp.idTipo_Deporte = tpb.idTipo_Deporte
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpb.idEquipos
		-- WHERE 
		-- 	cmp.idCampeonato = 4
		ORDER BY 1;
    
    -- BEISBOL
		SELECT 
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato"
		FROM TABLAS_POSICIONES_VOLEIBOL tpv
		INNER JOIN CAMPEONATO cmp 
			ON cmp.idCampeonato = tpv.idCampeonato AND
			   cmp.idTipo_campeonato = tpv.idTipo_campeonato AND
			   cmp.idDeporte = tpv.idDeporte AND
			   cmp.idTipo_Deporte = tpv.idTipo_Deporte
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpv.idEquipos
		-- WHERE 
		-- 	cmp.idCampeonato = 4
		ORDER BY 1;
    
-- Tabla de posiciones de campoenato
	-- FUTBOL
		SELECT tpf.Lugar_tabla_posiciones_futbol AS "Lugar",
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato",
		tpf.partidos_jugados_tabla_posiciones_futbol AS "PJ",
		tpf.partidos_ganados_tabla_posiciones_futbol AS "PG",
		tpf.partidos_empatados_tabla_posiciones_futbol AS "PE",
		tpf.partidos_perdidos_tabla_posiciones_futbol AS "PP",
		tpf.goles_a_favor_tabla_posiciones_futbol AS "GF",
		tpf.goles_en_contra_tabla_posiciones_futbol AS "GC",
		tpf.Diferencia_goles_tabla_posiciones_futbol AS "DG",
		tpf.Puntos_tabla_posiciones_futbol AS "Puntos"
		FROM TABLA_POSICIONES_FUTBOL tpf
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpf.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpf.idCampeonato AND
			   cmp.idTipo_campeonato = tpf.idTipo_campeonato AND
			   cmp.idDeporte = tpf.idDeporte AND
			   cmp.idTipo_Deporte = tpf.idTipo_Deporte;

	-- BASKET
		SELECT tpb.lugar_tabla_posiciones_basket AS "Lugar",
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato",
        tpb.partidos_jugados_tablas_posiciones_basket AS "PJ",
        tpb.partidos_ganados_tablas_posiciones_basket AS "PG",
        tpb.partidos_empatados_tablas_posiciones_basket AS "PE",
        tpb.partidos_perdidos_tablas_posiciones_basket AS "PP",
        tpb.puntos_a_favor_tablas_posiciones_basket AS "PF",
        tpb.puntos_en_contra_tablas_posiciones_basket AS "PC",
        tpb.puntos_tablas_posiciones_basket AS "Puntos"
		FROM TABLAS_POSICIONES_BASKET tpb
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpb.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpb.idCampeonato AND
			   cmp.idTipo_campeonato = tpb.idTipo_campeonato AND
			   cmp.idDeporte = tpb.idDeporte AND
			   cmp.idTipo_Deporte = tpb.idTipo_Deporte;

	-- VOLEIBOL
		SELECT tpv.lugar_tabla_posiciones_voleibol AS "Lugar",
        eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato",
        tpv.partidos_jugados_tabla_posiciones_voleibol AS "PJ",
        tpv.partidos_ganados_tabla_posiciones_voleibol AS "PG",
        tpv.partidos_perdidos_tabla_posiciones_voleibol AS "PP",
        tpv.set_ganados_tabla_posiciones_voleibol AS "SG",
        tpv.set_perdidos_tabla_posiciones_voleibol AS "SP",
        tpv.puntos_afavor_tabla_posiciones_voleibol AS "PA",
        tpv.puntos_encontra_tabla_posiciones_voleibol AS "PE",
        tpv.diferencia_puntos_tabla_posiciones_volibol AS "DP",
        tpv.puntos_tabla_posiciones_voleibol AS "Puntos"
		FROM TABLAS_POSICIONES_VOLEIBOL tpv
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpv.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpv.idCampeonato AND
			   cmp.idTipo_campeonato = tpv.idTipo_campeonato AND
			   cmp.idDeporte = tpv.idDeporte AND
			   cmp.idTipo_Deporte = tpv.idTipo_Deporte;

	-- BEISBOL
		SELECT tpb.lugar_tabla_posiciones_beisbol AS "Lugar",
		eq.nombre_equipo AS "Equipo",
		cmp.nombre_campeonato AS "Campeonato",
        tpb.juegos_jugados_tabla_posiciones_beisbol AS "JJ",
        tpb.juegos_ganados_tabla_posiciones_beisbol AS "JG",
        tpb.juegos_perdidos_tabla_posiciones_beisbol AS "JP",
        tpb.pct_tabla_posiciones_beisbol AS "PCT",
        tpb.racha_tabla_posiciones_beisbol AS "Racha",
        tpb.casa_tabla_posiciones_beisbol AS "Casa",
        tpb.ruta_tabla_posiciones_beisbol AS "Ruta",
        tpb.puntos_tabla_posiciones_beisbol AS "Puntos"
        FROM TABLA_POSICIONES_BEISBOL tpb
		INNER JOIN EQUIPOS eq 
			ON eq.idEquipos = tpb.idEquipos
		INNER JOIN CAMPEONATO cmp
			ON cmp.idCampeonato = tpb.idCampeonato AND
			   cmp.idTipo_campeonato = tpb.idTipo_campeonato AND
			   cmp.idDeporte = tpb.idDeporte AND
			   cmp.idTipo_Deporte = tpb.idTipo_Deporte;
