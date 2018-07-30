-- MySQL Script generated by MySQL Workbench
-- Thu Jul 26 04:16:31 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema p_polideportivo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema p_polideportivo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `p_polideportivo` DEFAULT CHARACTER SET utf8 ;
USE `p_polideportivo` ;

-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPOS_DEPORTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPOS_DEPORTE` (
  `idTipo_Deporte` INT NOT NULL AUTO_INCREMENT,
  `tipo_Tipo_Deporte` VARCHAR(35) NOT NULL,
  `descripcion_Tipo_Deporte` VARCHAR(55) NULL,
  PRIMARY KEY (`idTipo_Deporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`DEPORTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`DEPORTE` (
  `idDeporte` INT NOT NULL AUTO_INCREMENT,
  `cantidad_jugadores_deporte` INT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `descripcion_deporte` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDeporte`, `idTipo_Deporte`),
  INDEX `fk_Deporte_Tipos_Deporte1_idx` (`idTipo_Deporte` ASC),
  CONSTRAINT `fk_Deporte_Tipos_Deporte1`
    FOREIGN KEY (`idTipo_Deporte`)
    REFERENCES `p_polideportivo`.`TIPOS_DEPORTE` (`idTipo_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPO_ARBITRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPO_ARBITRO` (
  `idTipo_Arbitro` INT NOT NULL AUTO_INCREMENT,
  `tipo_tipo_arbitro` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_Arbitro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ARBITRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ARBITRO` (
  `idArbitro` INT NOT NULL AUTO_INCREMENT,
  `nombre_arbitro` VARCHAR(45) NULL,
  `apellido_arbitro` VARCHAR(45) NULL,
  `edad_arbitro` INT NULL,
  `direccion_arbitro` VARCHAR(45) NULL,
  `telefono_arbitro` VARCHAR(12) NULL,
  `email_arbitro` VARCHAR(45) NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_Arbitro` INT NOT NULL,
  PRIMARY KEY (`idArbitro`, `idDeporte`, `idTipo_Arbitro`),
  INDEX `fk_Arbitro_Deporte1_idx` (`idDeporte` ASC),
  INDEX `fk_Arbitro_Tipo_Arbitro1_idx` (`idTipo_Arbitro` ASC),
  CONSTRAINT `fk_Arbitro_Deporte1`
    FOREIGN KEY (`idDeporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Arbitro_Tipo_Arbitro1`
    FOREIGN KEY (`idTipo_Arbitro`)
    REFERENCES `p_polideportivo`.`TIPO_ARBITRO` (`idTipo_Arbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ENTRENADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ENTRENADORES` (
  `idEntrenador` INT NOT NULL AUTO_INCREMENT,
  `nombre_entrenadores` VARCHAR(45) NULL,
  `apellido_entrenadores` VARCHAR(45) NULL,
  `edad_entrenadores` INT NULL,
  `dirección_entrenadores` VARCHAR(45) NULL,
  `telefono_entrenadores` VARCHAR(12) NULL,
  `email_entrenadores` VARCHAR(45) NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  PRIMARY KEY (`idEntrenador`, `idDeporte`, `idTipo_Deporte`),
  INDEX `fk_Entrenadores_Deporte1_idx` (`idDeporte` ASC, `idTipo_Deporte` ASC),
  CONSTRAINT `fk_Entrenadores_Deporte1`
    FOREIGN KEY (`idDeporte` , `idTipo_Deporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte` , `idTipo_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`JUGADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`JUGADORES` (
  `idJugadores` INT NOT NULL AUTO_INCREMENT,
  `nombre_jugadores` VARCHAR(45) NULL,
  `apellido_jugadores` VARCHAR(45) NULL,
  `edad_jugadores` VARCHAR(45) NULL,
  `dirección_jugadores` VARCHAR(45) NULL,
  `telefono_jugadores` VARCHAR(45) NULL,
  `email_jugadores` VARCHAR(45) NULL,
  `genero_jugadores` VARCHAR(45) NULL,
  `fotografia_jugadores` VARCHAR(45) NULL,
  PRIMARY KEY (`idJugadores`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`AREA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`AREA` (
  `idArea` INT NOT NULL AUTO_INCREMENT,
  `nombrearea_area` VARCHAR(45) NULL,
  PRIMARY KEY (`idArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`PUESTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`PUESTO` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT,
  `Nombrepuesto_Puesto` VARCHAR(45) NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`EMPLEADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`EMPLEADOS` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleados` VARCHAR(45) NULL,
  `apellido_empleados` VARCHAR(45) NULL,
  `edad_empleados` INT NULL,
  `dirección_empleados` VARCHAR(55) NULL,
  `telefono_empleados` VARCHAR(12) NULL,
  `email_empleados` VARCHAR(45) NULL,
  `idArea` INT NOT NULL,
  `idPuesto` INT NOT NULL,
  PRIMARY KEY (`idEmpleados`),
  INDEX `fk_Empleados_Area1_idx` (`idArea` ASC),
  INDEX `fk_Empleados_Puesto1_idx` (`idPuesto` ASC),
  CONSTRAINT `fk_Empleados_Area1`
    FOREIGN KEY (`idArea`)
    REFERENCES `p_polideportivo`.`AREA` (`idArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleados_Puesto1`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `p_polideportivo`.`PUESTO` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPO_CAMPEONATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPO_CAMPEONATO` (
  `idTipo_campeonato` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Tipo_campeonato` VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_campeonato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`CAMPEONATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`CAMPEONATO` (
  `idCampeonato` INT NOT NULL AUTO_INCREMENT,
  `nombre_campeonato` VARCHAR(45) NULL,
  `fecha_inicio_campenato` DATE NULL,
  `fecha_finalización_campeonato` DATE NULL,
  `cantidad_equipos_campeonato` INT NULL,
  `idEmpleados` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  PRIMARY KEY (`idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_Campeonato_Empleados1_idx` (`idEmpleados` ASC),
  INDEX `fk_Campeonato_Tipo_campeonato1_idx` (`idTipo_campeonato` ASC),
  INDEX `fk_Campeonato_Deporte1_idx` (`idDeporte` ASC, `idTipo_Deporte` ASC),
  CONSTRAINT `fk_Campeonato_Empleados1`
    FOREIGN KEY (`idEmpleados`)
    REFERENCES `p_polideportivo`.`EMPLEADOS` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campeonato_Tipo_campeonato1`
    FOREIGN KEY (`idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`TIPO_CAMPEONATO` (`idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Campeonato_Deporte1`
    FOREIGN KEY (`idDeporte` , `idTipo_Deporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte` , `idTipo_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`EQUIPOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`EQUIPOS` (
  `idEquipos` INT NOT NULL AUTO_INCREMENT,
  `nombre_equipo` VARCHAR(45) NULL,
  `cantidad_jugadores_Equipo` INT NULL,
  `idEntrenador` INT NOT NULL,
  PRIMARY KEY (`idEquipos`),
  INDEX `fk_Equipos_Entrenadores1_idx` (`idEntrenador` ASC),
  CONSTRAINT `fk_Equipos_Entrenadores1`
    FOREIGN KEY (`idEntrenador`)
    REFERENCES `p_polideportivo`.`ENTRENADORES` (`idEntrenador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ESTADO_PARTIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ESTADO_PARTIDO` (
  `idEstado_partido` INT NOT NULL AUTO_INCREMENT,
  `Estado_estado_partido` VARCHAR(45) NULL,
  PRIMARY KEY (`idEstado_partido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`CAMPOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`CAMPOS` (
  `idCampos` INT NOT NULL AUTO_INCREMENT,
  `campo_campos` VARCHAR(45) NULL,
  `estado_campos` VARCHAR(2) NOT NULL,
  `idTipos_Deporte` INT NOT NULL,
  PRIMARY KEY (`idCampos`, `idTipos_Deporte`),
  INDEX `fk_Campos_Tipos_Deporte1_idx` (`idTipos_Deporte` ASC),
  CONSTRAINT `fk_Campos_Tipos_Deporte1`
    FOREIGN KEY (`idTipos_Deporte`)
    REFERENCES `p_polideportivo`.`TIPOS_DEPORTE` (`idTipo_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`JORNADAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`JORNADAS` (
  `idJornadas` INT NOT NULL AUTO_INCREMENT,
  `fecha_hora_jornadas` DATE NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idEstado_partido` INT NOT NULL,
  `idArbitro` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_Arbitro` INT NOT NULL,
  `idCampos` INT NOT NULL,
  `idTipos_Deporte` INT NOT NULL,
  `goles_local_jornadas` INT NULL,
  `goles_visita_jornadas` INT NULL,
  `Hora_jornadas` TIME NULL,
  `idEquipos_local` INT NOT NULL,
  `idEquipos_visita` INT NOT NULL,
  PRIMARY KEY (`idJornadas`, `idCampeonato`, `idEstado_partido`, `idEquipos_local`, `idEquipos_visita`),
  INDEX `fk_Jornadas_Campeonato1_idx` (`idCampeonato` ASC),
  INDEX `fk_Jornadas_Estado_partido1_idx` (`idEstado_partido` ASC),
  INDEX `fk_Jornadas_Arbitro1_idx` (`idArbitro` ASC, `idDeporte` ASC, `idTipo_Arbitro` ASC),
  INDEX `fk_Jornadas_Campos1_idx` (`idCampos` ASC, `idTipos_Deporte` ASC),
  INDEX `fk_JORNADAS_EQUIPOS1_idx` (`idEquipos_local` ASC),
  INDEX `fk_JORNADAS_EQUIPOS2_idx` (`idEquipos_visita` ASC),
  CONSTRAINT `fk_Jornadas_Campeonato1`
    FOREIGN KEY (`idCampeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jornadas_Estado_partido1`
    FOREIGN KEY (`idEstado_partido`)
    REFERENCES `p_polideportivo`.`ESTADO_PARTIDO` (`idEstado_partido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jornadas_Arbitro1`
    FOREIGN KEY (`idArbitro` , `idDeporte` , `idTipo_Arbitro`)
    REFERENCES `p_polideportivo`.`ARBITRO` (`idArbitro` , `idDeporte` , `idTipo_Arbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Jornadas_Campos1`
    FOREIGN KEY (`idCampos` , `idTipos_Deporte`)
    REFERENCES `p_polideportivo`.`CAMPOS` (`idCampos` , `idTipos_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JORNADAS_EQUIPOS1`
    FOREIGN KEY (`idEquipos_local`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JORNADAS_EQUIPOS2`
    FOREIGN KEY (`idEquipos_visita`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`UNIFORME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`UNIFORME` (
  `idUniforme` INT NOT NULL AUTO_INCREMENT,
  `local_color_uniforme` VARCHAR(45) NULL,
  `visita_color_uniforme` VARCHAR(45) NULL,
  `idEquipos` INT NOT NULL,
  PRIMARY KEY (`idUniforme`, `idEquipos`),
  INDEX `fk_Uniforme_Equipos1_idx` (`idEquipos` ASC),
  CONSTRAINT `fk_Uniforme_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`JUGADORES_REGISTRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`JUGADORES_REGISTRO` (
  `id_jugreg` INT NOT NULL AUTO_INCREMENT,
  `fecha_ini_jugadores_registro` DATE NOT NULL,
  `fecha_fin_jugadores_registro` DATE NULL,
  `descripcion_jugadoresregistro` VARCHAR(45) NULL,
  `idEquipos` INT NOT NULL,
  `idJugadores` INT NOT NULL,
  PRIMARY KEY (`id_jugreg`, `idEquipos`),
  INDEX `fk_jugadores_registro_Equipos1_idx` (`idEquipos` ASC),
  INDEX `fk_jugadores_registro_Jugadores1_idx` (`idJugadores` ASC),
  CONSTRAINT `fk_jugadores_registro_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_registro_Jugadores1`
    FOREIGN KEY (`idJugadores`)
    REFERENCES `p_polideportivo`.`JUGADORES` (`idJugadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TARJETAS_FUTBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TARJETAS_FUTBOL` (
  `idTarjetas_futbol` INT NOT NULL AUTO_INCREMENT,
  `Tarjeta_tarjetas_futbol` VARCHAR(45) NULL,
  PRIMARY KEY (`idTarjetas_futbol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`AMONESTACIONES_FUBTOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`AMONESTACIONES_FUBTOL` (
  `idAmonestaciones` INT NOT NULL AUTO_INCREMENT,
  `descripcion_amonestaciones_futbol` VARCHAR(45) NULL,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  `idTarjetas_futbol` INT NOT NULL,
  PRIMARY KEY (`idAmonestaciones`, `id_jugreg`, `idEquipos`),
  INDEX `fk_Amonestaciones_futbol_jugadores_registro1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  INDEX `fk_Amonestaciones_futbol_Tarjetas_futbol1_idx` (`idTarjetas_futbol` ASC),
  CONSTRAINT `fk_Amonestaciones_futbol_jugadores_registro1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Amonestaciones_futbol_Tarjetas_futbol1`
    FOREIGN KEY (`idTarjetas_futbol`)
    REFERENCES `p_polideportivo`.`TARJETAS_FUTBOL` (`idTarjetas_futbol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLA_POSICIONES_FUTBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLA_POSICIONES_FUTBOL` (
  `idTabla_Posiciones_Futbol` INT NOT NULL AUTO_INCREMENT,
  `Lugar_tabla_posiciones_futbol` INT NULL,
  `partidos_jugados_tabla_posiciones_futbol` INT NULL,
  `partidos_ganados_tabla_posiciones_futbol` INT NULL,
  `partidos_empatados_tabla_posiciones_futbol` INT NULL,
  `goles_a_favor_tabla_posiciones_futbol` INT NULL,
  `partidos_perdidos_tabla_posiciones_futbol` INT NULL,
  `goles_en_contra_tabla_posiciones_futbol` INT NULL,
  `Diferencia_goles_tabla_posiciones_futbol` INT NULL,
  `Puntos_tabla_posiciones_futbol` INT NULL,
  `Fecha_inicio_tabla_posiciones_futbol` DATE NULL,
  `Fecha_finalizacion_tabla_posiciones_futbol` DATE NULL,
  `idCampeonato` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  PRIMARY KEY (`idTabla_Posiciones_Futbol`, `idCampeonato`, `idEquipos`),
  INDEX `fk_Tabla_Posiciones_Futbol_Campeonato1_idx` (`idCampeonato` ASC),
  INDEX `fk_Tabla_Posiciones_Futbol_Equipos1_idx` (`idEquipos` ASC),
  CONSTRAINT `fk_Tabla_Posiciones_Futbol_Campeonato1`
    FOREIGN KEY (`idCampeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tabla_Posiciones_Futbol_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`POSICION_JUGADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`POSICION_JUGADOR` (
  `id_pogjug` INT NOT NULL AUTO_INCREMENT,
  `posicion_posicionjugador` VARCHAR(30) NOT NULL,
  `descripcion_posicionjugador` VARCHAR(55) NULL,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  PRIMARY KEY (`id_pogjug`, `id_jugreg`, `idEquipos`),
  INDEX `fk_Posicion_jugador_jugadores_registro1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  CONSTRAINT `fk_Posicion_jugador_jugadores_registro1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLAS_POSICIONES_BASKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLAS_POSICIONES_BASKET` (
  `idTablas_posiciones_basket` INT NOT NULL AUTO_INCREMENT,
  `partidos_jugados_tablas_posiciones_basket` INT NULL,
  `partidos_ganados_tablas_posiciones_basket` INT NULL,
  `partidos_perdidos_tablas_posiciones_basket` INT NULL,
  `partidos_empatados_tablas_posiciones_basket` INT NULL,
  `puntos_a_favor_tablas_posiciones_basket` INT NULL,
  `puntos_en_contra_tablas_posiciones_basket` INT NULL,
  `Diferencia_tablas_posiciones_basket` INT NULL,
  `puntos_tablas_posiciones_basket` INT NULL,
  `Fecha_inicio_tablas_posiciones_basket` DATE NULL,
  `Fecha_fin_tablas_posiciones_basket` DATE NULL,
  `idCampeonato` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  `lugar_tabla_posiciones_basket` INT NOT NULL,
  PRIMARY KEY (`idTablas_posiciones_basket`, `idCampeonato`, `idEquipos`),
  INDEX `fk_Tablas_posiciones_basket_Campeonato1_idx` (`idCampeonato` ASC),
  INDEX `fk_Tablas_posiciones_basket_Equipos1_idx` (`idEquipos` ASC),
  CONSTRAINT `fk_Tablas_posiciones_basket_Campeonato1`
    FOREIGN KEY (`idCampeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tablas_posiciones_basket_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ANOTACIONES_FUTBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ANOTACIONES_FUTBOL` (
  `idAnotaciones_futbol` INT NOT NULL AUTO_INCREMENT,
  `Goles_Anotaciones_futbol` INT NULL DEFAULT 0,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  PRIMARY KEY (`idAnotaciones_futbol`, `id_jugreg`, `idEquipos`),
  INDEX `fk_Anotaciones_futbol_jugadores_registro1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  CONSTRAINT `fk_Anotaciones_futbol_jugadores_registro1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ANOTACIONES_BASKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ANOTACIONES_BASKET` (
  `idAnotaciones_basket` INT NOT NULL AUTO_INCREMENT,
  `Puntos_Anotaciones_basket` INT NULL DEFAULT 0,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  PRIMARY KEY (`idAnotaciones_basket`, `id_jugreg`, `idEquipos`),
  INDEX `fk_Anotaciones_basket_jugadores_registro1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  CONSTRAINT `fk_Anotaciones_basket_jugadores_registro1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`AMONESTACIONES_BASKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`AMONESTACIONES_BASKET` (
  `idAmonestaciones_basket` INT NOT NULL AUTO_INCREMENT,
  `Cantidad_faltas_amonestaciones_basket` INT NULL DEFAULT 0,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  PRIMARY KEY (`idAmonestaciones_basket`, `id_jugreg`, `idEquipos`),
  INDEX `fk_Amonestaciones_basket_jugadores_registro1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  CONSTRAINT `fk_Amonestaciones_basket_jugadores_registro1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`USUARIOS` (
  `idUsuarios` INT NOT NULL,
  `user_usuarios` VARCHAR(45) NULL,
  `pass_usuarios` VARCHAR(45) NULL,
  `Tipo_usuarios` VARCHAR(1) NULL,
  `Empleados_idEmpleados` INT NOT NULL,
  `estado_usuarios` VARCHAR(1) NULL,
  PRIMARY KEY (`idUsuarios`, `Empleados_idEmpleados`),
  INDEX `fk_Usuarios_Empleados1_idx` (`Empleados_idEmpleados` ASC),
  CONSTRAINT `fk_Usuarios_Empleados1`
    FOREIGN KEY (`Empleados_idEmpleados`)
    REFERENCES `p_polideportivo`.`EMPLEADOS` (`idEmpleados`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`BITACORA_LOGIN`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`BITACORA_LOGIN` (
  `idBITACORA` INT NOT NULL AUTO_INCREMENT,
  `usuario_bitacora` VARCHAR(45) NOT NULL,
  `fecha_bitacora` DATE NOT NULL,
  `host_bitacora` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idBITACORA`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLAS_POSICIONES_VOLEIBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLAS_POSICIONES_VOLEIBOL` (
  `idTabla_Posiciones_Voleibol` INT NOT NULL AUTO_INCREMENT,
  `lugar_tabla_posiciones_voleibol` INT NULL,
  `partidos_jugados_tabla_posiciones_voleibol` INT NULL,
  `partidos_ganados_tabla_posiciones_voleibol` INT NULL,
  `partidos_perdidos_tabla_posiciones_voleibol` INT NULL,
  `set_perdidos_tabla_posiciones_voleibol` INT NULL,
  `set_ganados_tabla_posiciones_voleibol` INT NULL,
  `puntos_afavor_tabla_posiciones_voleibol` INT NULL,
  `puntos_encontra_tabla_posiciones_voleibol` INT NULL,
  `diferencia_puntos_tabla_posiciones_volibol` INT NULL,
  `puntos_tabla_posiciones_voleibol` INT NULL,
  `idCampeonato` INT NOT NULL,
  `EQUIPOS_idEquipos` INT NOT NULL,
  PRIMARY KEY (`idTabla_Posiciones_Voleibol`, `idCampeonato`, `EQUIPOS_idEquipos`),
  INDEX `fk_TABLAS_POSICIONES_VOLEIBOL_CAMPEONATO1_idx` (`idCampeonato` ASC),
  INDEX `fk_TABLAS_POSICIONES_VOLEIBOL_EQUIPOS1_idx` (`EQUIPOS_idEquipos` ASC),
  CONSTRAINT `fk_TABLAS_POSICIONES_VOLEIBOL_CAMPEONATO1`
    FOREIGN KEY (`idCampeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TABLAS_POSICIONES_VOLEIBOL_EQUIPOS1`
    FOREIGN KEY (`EQUIPOS_idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLA_POSICIONES_BEISBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLA_POSICIONES_BEISBOL` (
  `idtabla_posiciones_beisbol` INT NOT NULL AUTO_INCREMENT,
  `juegos_jugados_tabla_posiciones_beisbol` INT NULL,
  `juegos_ganados_tabla_posiciones_beisbol` INT NULL,
  `juegos_perdidos_tabla_posiciones_beisbol` INT NULL,
  `lugar_tabla_posiciones_beisbol` INT NULL,
  `pct_tabla_posiciones_beisbol` DECIMAL NULL,
  `puntos_tabla_posiciones_beisbol` INT NULL,
  `racha_tabla_posiciones_beisbol` VARCHAR(7) NULL,
  `casa_tabla_posiciones_beisbol` VARCHAR(8) NULL,
  `ruta_tabla_posiciones_beisbol` VARCHAR(8) NULL,
  `CAMPEONATO_idCampeonato` INT NOT NULL,
  `CAMPEONATO_idTipo_Deporte` INT NOT NULL,
  `CAMPEONATO_idDeporte` INT NOT NULL,
  `CAMPEONATO_idTipo_campeonato` INT NOT NULL,
  `EQUIPOS_idEquipos` INT NOT NULL,
  PRIMARY KEY (`idtabla_posiciones_beisbol`, `CAMPEONATO_idCampeonato`, `CAMPEONATO_idTipo_Deporte`, `CAMPEONATO_idDeporte`, `CAMPEONATO_idTipo_campeonato`, `EQUIPOS_idEquipos`),
  INDEX `fk_TABLA_POSICIONES_BEISBOL_CAMPEONATO1_idx` (`CAMPEONATO_idCampeonato` ASC, `CAMPEONATO_idTipo_Deporte` ASC, `CAMPEONATO_idDeporte` ASC, `CAMPEONATO_idTipo_campeonato` ASC),
  INDEX `fk_TABLA_POSICIONES_BEISBOL_EQUIPOS1_idx` (`EQUIPOS_idEquipos` ASC),
  CONSTRAINT `fk_TABLA_POSICIONES_BEISBOL_CAMPEONATO1`
    FOREIGN KEY (`CAMPEONATO_idCampeonato` , `CAMPEONATO_idTipo_Deporte` , `CAMPEONATO_idDeporte` , `CAMPEONATO_idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TABLA_POSICIONES_BEISBOL_EQUIPOS1`
    FOREIGN KEY (`EQUIPOS_idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
