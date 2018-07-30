-- PROCEDIMIENTOS A TABLAS PRINCIPALES --
-- JUGADORES -- 
delimiter $
create procedure ingresar_jugador(in nom varchar(45),in ape varchar(45),in edadd int, in direcc varchar(45),
 in tel varchar(12), in correo varchar(45), in sexo varchar(1),in foto varchar(45), posicion_jugador int)
begin
	insert into jugadores (nombre_jugadores,apellido_jugadores,edad_jugadores,dirección_jugadores,telefono_jugadores,
    email_jugadores,genero_jugadores,fotografia_jugadores,POSICION_JUGADOR_id_pogjug) values (nom,ape,edadd,direcc,tel,correo,sexo,foto,posicion_jugador);
end$

-- DEPORTE--
delimiter $
create procedure ingresar_deporte (in num_jugadores int, tdeporte int)
begin
	insert into deporte (cantidad_jugadores_deporte,idTipo_Deporte) values (num_jugadores,tdeporte);
end$

-- ENTRENADOR -- 
delimiter $
create procedure ingresar_entrenador(in nome varchar(45),in apee varchar(45),in edadde int, in direcce varchar(45),
 in tele varchar(12), in correoe varchar(45), in iddepor int)
begin
	insert into entrenadores (nombre_entrenadores,apellido_entrenadores,edad_entrenadores,dirección_entrenadores,telefono_entrenadores,email_entrenadores,iddeporte) 
    values (nome,apee,edadde,direcce,tele,correoe,iddepor);
end$
-- EQUIPOS --
select * from equipos;
delimiter $
create procedure ingresar_equipo(in nomeq varchar(35), in num_juga int , in idEntre int, in unifor int)
begin
	insert into equipos (nombre_equipo,cantidad_jugadores_equipo,identrenador,UNIFORME_idUniforme)
    values (nomeq,num_juga,identre,unifor);
end$ 

-- ARBITRO --
delimiter $
create procedure ingresar_arbitro(in noma varchar(45), in apea varchar(45), in edada int, 
in direcca varchar(45),in tel varchar(12),in emaila varchar(45), in iddport int, in idtipo int)
begin
	insert into arbitro (nombre_arbitro,apellido_arbitro,edad_arbitro,direccion_arbitro,telefono_arbitro,
    email_arbitro,iddeporte,idTipo_Arbitro) 
    values (noma,apea,edada,direcca,tel,emaila,iddport,idtipo);
end$ 

-- CAMPOS-- 
delimiter $
create procedure ingresar_campo(in campo varchar(20), in estado varchar(20),in tipodeport int)
begin
	insert into campos (campo_campos,estado_campos,idTipos_Deporte) values (campo,estado,tipodeport);
end$

-- EMPLEADOS -- 
delimiter $
create procedure ingresar_empleado(in nome varchar(45), in apee varchar(45), in edade int, 
in direcc varchar(45),in tel varchar(12),in emaile varchar(45), in area int, in puesto int)
begin
	insert into empleados (nombre_empleados,apellido_empleados,edad_empleados,dirección_empleados,
    telefono_empleados,email_empleados,idarea,idpuesto) 
    values (nome,apee,edade,direcc,tel,emaile,area,puesto);
end$

-- USUARIOS --
delimiter $
create procedure ingresar_usuario(in usuario varchar(25),in contra varchar(25),
in tipo varchar(1), in empleado int, in estado varchar(1))
begin
	insert into usuarios (user_usuarios,pass_usuarios,tipo_usuarios,Empleados_idEmpleados,estado_usuarios)
    values (usuario,contra,tipo,empleado,estado);
end$

-- BITACORA -- 
delimiter $
create procedure ingresar_bitacora(in usuario varchar(45), in fecha DATE, in hosst varchar(45))
begin
	insert into bitacora_login (usuario_bitacora,fecha_bitacora,host_bitacora) values (usuario,fecha,hosst);
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