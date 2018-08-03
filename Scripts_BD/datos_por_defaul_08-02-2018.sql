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
create PROCEDURE `ingresarcoloruniforme`(in localcolor varchar(15))
begin
	insert into  UNIFORME (local_color_uniforme)  values (localcolor);
end$

call ingresarcoloruniforme('rojo');
call ingresarcoloruniforme('azul');
call ingresarcoloruniforme('blanco');
call ingresarcoloruniforme('negro');
call ingresarcoloruniforme('verde');
call ingresarcoloruniforme('amarillo');
call ingresarcoloruniforme('Anaranjado');
call ingresarcoloruniforme('Morado');

