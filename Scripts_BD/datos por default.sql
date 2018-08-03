-- DATOS POR DEFAUL --

-- POSICION DE JUGADORES---
delimiter $
create PROCEDURE `ingresarposicionjugador`(in pos varchar(50))
begin
	insert into posicion_jugador  (posicion_posicionjugador)  values (pos);
end$

call ingresarposicionjugador ('portero_futbol');
call ingresarposicionjugador ('defensa_futbol');
call ingresarposicionjugador ('mediocampista_futbol');
call ingresarposicionjugador ('delantero_futbol');

call ingresarposicionjugador ('base_basket');
call ingresarposicionjugador ('escolta_basket');
call ingresarposicionjugador ('alera_basket');
call ingresarposicionjugador ('ala-pivot_basket');
call ingresarposicionjugador ('pivot_basket');

call ingresarposicionjugador ('delantero_voli');
call ingresarposicionjugador ('zagueros_voli');

call ingresarposicionjugador ('lanzador_beisbol');
call ingresarposicionjugador ('receptor_beisbol');
call ingresarposicionjugador ('primerabase_beisbol');
call ingresarposicionjugador ('segundabase_beisbol');
call ingresarposicionjugador ('tercerabase_beisbol');
call ingresarposicionjugador ('parador en cort_beisbol');
call ingresarposicionjugador ('jardineroizquierdo_beisbol');
call ingresarposicionjugador ('jardineroderecho_beisbol');
call ingresarposicionjugador ('jardinerocentral_beisbol');

-- TIPO ANOTACIONES--

delimiter $
create PROCEDURE `ingresartipoanotacion`(in anotacion varchar(50))
begin
	insert into tipo_anotaciones  (clase_tipo_anotaciones)  values (anotacion);
end$

select * from tipo_anotaciones;
call ingresartipoanotacion ('gol_futbol');

call ingresartipoanotacion ('unpunto basket');
call ingresartipoanotacion ('dospuntos basket');
call ingresartipoanotacion ('trespuntos basket');

call ingresartipoanotacion ('un punto');

call ingresartipoanotacion ('carreras');
call ingresartipoanotacion ('atrapadas');
call ingresartipoanotacion ('jonron');

-- TIPO DE ARBITRO -- 

delimiter $
create PROCEDURE `ingresartipoarbitro`(in tipo varchar(50))
begin
	insert into tipo_arbitro  (tipo_tipo_arbitro)  values (tipo);
end$

call ingresartipoarbitro ('central_futbol');
call ingresartipoarbitro ('fuera de juego_futbol');
call ingresartipoarbitro ('notificacambios_futbol');

call ingresartipoarbitro ('central-basket');
call ingresartipoarbitro ('mesa-basket');

call ingresartipoarbitro ('primerarbitro_voli');
call ingresartipoarbitro ('segundoarbitro-voli');
call ingresartipoarbitro ('anotador-voli');
call ingresartipoarbitro ('anotadorasistente-voli');
call ingresartipoarbitro ('juecesdelinea-voli');

call ingresartipoarbitro ('ampayerprincipal-beisbol');
call ingresartipoarbitro ('ampayerlineal-beisbol');
call ingresartipoarbitro ('ampayercentral-beisbol');

-- TIPO DE AMONESTACION -- 

delimiter $
create PROCEDURE `ingresartipoamonestacion`(in tipoa varchar(50))
begin
	insert into tipo_amonestaciones (clase_tipo_amonestaciones)  values (tipoa);
end$

call ingresartipoamonestacion ('Tarjeta Amarilla');
call ingresartipoamonestacion ('Tarjeta Roja');

-- ESTADO DEL PARTIDO --
select * from estado_partido; 
delimiter $
create PROCEDURE `ingresarestadopartido`(in estado varchar(50))
begin
	insert into estado_partido (Estado_estado_partido)  values (estado);

end$

call ingresarestadopartido('Concluido');
call ingresarestadopartido('En curso');
call ingresarestadopartido('Aplazado');
call ingresarestadopartido('Perdido por default');

-- AREA -- 

delimiter $
create PROCEDURE `ingresararea`(in area varchar(50))
begin
	insert into area (nombrearea_area)  values (area);

end$

call ingresararea ('Direccion general');
call ingresararea ('Recursos humanos');
call ingresararea ('Publicidad');
call ingresararea ('Informatica');
call ingresararea ('Mantenimiento');
call ingresararea ('Seguridad');


-- PUESTO -- 

delimiter $
create PROCEDURE `ingresarpuesto`(in puesto varchar(50))
begin
	insert into puesto (Nombrepuesto_Puesto)  values (puesto);

end$

call ingresarpuesto ('Gerente');
call ingresarpuesto ('Secretaria');
call ingresarpuesto ('Tecnico');
call ingresarpuesto ('Limpiador');
call ingresarpuesto ('Bodeguero');
call ingresarpuesto ('Contador');
call ingresarpuesto ('Oficial de Seguridad');


delimiter $
create PROCEDURE `ingresartipocampeonato`(in tipoc varchar(50))
begin
	insert into tipo_campeonato (Tipo_Tipo_campeonato)  values (tipoc);

end$

call ingresartipocampeonato ('Fase de grupos');
call ingresartipocampeonato ('ida');
call ingresartipocampeonato ('ida y vuelta');
call ingresartipocampeonato ('Eliminacion directa');

-- TIPO DE DEPORTE --
select * from tipos_deporte;
delimiter $
create PROCEDURE `ingresartipodeporte`(in tipod varchar(50))
begin
	insert into tipos_deporte (tipo_Tipo_Deporte)  values (tipod);
end$

call ingresartipodeporte ('Futbol');
call ingresartipodeporte ('Basquetbol');
call ingresartipodeporte ('Voleibol');
call ingresartipodeporte ('Beisbol');

-- COLORES UNIFORME --

delimiter $
create PROCEDURE `ingresarcoloruniforme`(in localcolor varchar(15),in visitacolor varchar(15))
begin
	insert into  UNIFORME (local_color_uniforme,visita_color_uniforme)  values (localcolor,visitacolor);
end$

call ingresarcoloruniforme('rojo','azul');
call ingresarcoloruniforme('azul','rojo');
call ingresarcoloruniforme('blanco','negro');
call ingresarcoloruniforme('negro','blanco');
call ingresarcoloruniforme('verde','amarillo');
call ingresarcoloruniforme('amarillo','verde');
call ingresarcoloruniforme('Anaranjado','Azul');





-- PROCEDIMIENTOS A TABLAS PRINCIPALES --
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
