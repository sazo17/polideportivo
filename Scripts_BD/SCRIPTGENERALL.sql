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
-- Table `p_polideportivo`.`TIPO_ARBITRO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPO_ARBITRO` (
  `idTipo_Arbitro` INT NOT NULL AUTO_INCREMENT,
  `tipo_tipo_arbitro` VARCHAR(25) NULL,
  PRIMARY KEY (`idTipo_Arbitro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`USUARIOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`USUARIOS` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `user_usuarios` VARCHAR(16) NULL,
  `pass_usuarios` VARCHAR(30) NULL,
  `Tipo_usuarios` VARCHAR(1) NULL,
  `estado_usuarios` VARCHAR(1) NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPOS_DEPORTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPOS_DEPORTE` (
  `idTipo_Deporte` INT NOT NULL AUTO_INCREMENT,
  `tipo_Tipo_Deporte` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idTipo_Deporte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`DEPORTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`DEPORTE` (
  `idDeporte` INT NOT NULL AUTO_INCREMENT,
  `cantidad_jugadores_deporte` INT NULL,
  `idTipo_Deporte` INT NOT NULL,
  PRIMARY KEY (`idDeporte`, `idTipo_Deporte`),
  INDEX `fk_Deporte_Tipos_Deporte1_idx` (`idTipo_Deporte` ASC),
  CONSTRAINT `fk_Deporte_Tipos_Deporte1`
    FOREIGN KEY (`idTipo_Deporte`)
    REFERENCES `p_polideportivo`.`TIPOS_DEPORTE` (`idTipo_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
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
  `idTipo_Arbitro` INT NOT NULL,
  `idUsuarios` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  PRIMARY KEY (`idArbitro`, `idTipo_Arbitro`),
  INDEX `fk_Arbitro_Tipo_Arbitro1_idx` (`idTipo_Arbitro` ASC),
  INDEX `fk_ARBITRO_USUARIOS1_idx` (`idUsuarios` ASC),
  INDEX `fk_ARBITRO_DEPORTE1_idx` (`idDeporte` ASC, `idTipo_Deporte` ASC),
  CONSTRAINT `fk_Arbitro_Tipo_Arbitro1`
    FOREIGN KEY (`idTipo_Arbitro`)
    REFERENCES `p_polideportivo`.`TIPO_ARBITRO` (`idTipo_Arbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARBITRO_USUARIOS1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `p_polideportivo`.`USUARIOS` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARBITRO_DEPORTE1`
    FOREIGN KEY (`idDeporte` , `idTipo_Deporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte` , `idTipo_Deporte`)
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
  `USUARIOS_idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idEntrenador`, `idDeporte`),
  INDEX `fk_Entrenadores_Deporte1_idx` (`idDeporte` ASC),
  INDEX `fk_ENTRENADORES_USUARIOS1_idx` (`USUARIOS_idUsuarios` ASC),
  CONSTRAINT `fk_Entrenadores_Deporte1`
    FOREIGN KEY (`idDeporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ENTRENADORES_USUARIOS1`
    FOREIGN KEY (`USUARIOS_idUsuarios`)
    REFERENCES `p_polideportivo`.`USUARIOS` (`idUsuarios`)
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
  `edad_jugadores` INT NULL,
  `dirección_jugadores` VARCHAR(45) NULL,
  `telefono_jugadores` VARCHAR(12) NULL,
  `email_jugadores` VARCHAR(45) NULL,
  `genero_jugadores` VARCHAR(1) NULL,
  `fotografia_jugadores` VARCHAR(45) NULL,
  `idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idJugadores`),
  INDEX `fk_JUGADORES_USUARIOS1_idx` (`idUsuarios` ASC),
  CONSTRAINT `fk_JUGADORES_USUARIOS1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `p_polideportivo`.`USUARIOS` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`AREA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`AREA` (
  `idArea` INT NOT NULL AUTO_INCREMENT,
  `nombrearea_area` VARCHAR(25) NULL,
  PRIMARY KEY (`idArea`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`PUESTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`PUESTO` (
  `idPuesto` INT NOT NULL AUTO_INCREMENT,
  `Nombrepuesto_Puesto` VARCHAR(35) NULL,
  PRIMARY KEY (`idPuesto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`EMPLEADOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`EMPLEADOS` (
  `idEmpleados` INT NOT NULL AUTO_INCREMENT,
  `nombre_empleados` VARCHAR(50) NULL,
  `apellido_empleados` VARCHAR(50) NULL,
  `edad_empleados` INT NULL,
  `dirección_empleados` VARCHAR(55) NULL,
  `telefono_empleados` VARCHAR(12) NULL,
  `email_empleados` VARCHAR(45) NULL,
  `idArea` INT NOT NULL,
  `idPuesto` INT NOT NULL,
  `idUsuarios` INT NOT NULL,
  PRIMARY KEY (`idEmpleados`),
  INDEX `fk_Empleados_Area1_idx` (`idArea` ASC),
  INDEX `fk_Empleados_Puesto1_idx` (`idPuesto` ASC),
  INDEX `fk_EMPLEADOS_USUARIOS1_idx` (`idUsuarios` ASC),
  CONSTRAINT `fk_Empleados_Area1`
    FOREIGN KEY (`idArea`)
    REFERENCES `p_polideportivo`.`AREA` (`idArea`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleados_Puesto1`
    FOREIGN KEY (`idPuesto`)
    REFERENCES `p_polideportivo`.`PUESTO` (`idPuesto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EMPLEADOS_USUARIOS1`
    FOREIGN KEY (`idUsuarios`)
    REFERENCES `p_polideportivo`.`USUARIOS` (`idUsuarios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPO_CAMPEONATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPO_CAMPEONATO` (
  `idTipo_campeonato` INT NOT NULL AUTO_INCREMENT,
  `Tipo_Tipo_campeonato` VARCHAR(30) NULL,
  PRIMARY KEY (`idTipo_campeonato`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`CAMPEONATO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`CAMPEONATO` (
  `idCampeonato` INT NOT NULL AUTO_INCREMENT,
  `nombre_campeonato` VARCHAR(50) NULL,
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
-- Table `p_polideportivo`.`UNIFORME`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`UNIFORME` (
  `idUniforme` INT NOT NULL AUTO_INCREMENT,
  `local_color_uniforme` VARCHAR(15) NULL,
  PRIMARY KEY (`idUniforme`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`EQUIPOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`EQUIPOS` (
  `idEquipos` INT NOT NULL AUTO_INCREMENT,
  `nombre_equipo` VARCHAR(35) NULL,
  `cantidad_jugadores_Equipo` INT NULL,
  `idEntrenador` INT NOT NULL,
  `UNIFORME_idUniforme` INT NOT NULL,
  PRIMARY KEY (`idEquipos`, `UNIFORME_idUniforme`),
  INDEX `fk_Equipos_Entrenadores1_idx` (`idEntrenador` ASC),
  INDEX `fk_EQUIPOS_UNIFORME1_idx` (`UNIFORME_idUniforme` ASC),
  CONSTRAINT `fk_Equipos_Entrenadores1`
    FOREIGN KEY (`idEntrenador`)
    REFERENCES `p_polideportivo`.`ENTRENADORES` (`idEntrenador`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EQUIPOS_UNIFORME1`
    FOREIGN KEY (`UNIFORME_idUniforme`)
    REFERENCES `p_polideportivo`.`UNIFORME` (`idUniforme`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`CAMPOS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`CAMPOS` (
  `idCampos` INT NOT NULL AUTO_INCREMENT,
  `campo_campos` VARCHAR(20) NULL,
  `estado_campos` VARCHAR(20) NOT NULL,
  `fotorafia_campos` VARCHAR(45) NULL,
  `ancho_campos` INT NOT NULL,
  `largo_campos` INT NOT NULL,
  PRIMARY KEY (`idCampos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ESTADO_PARTIDO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ESTADO_PARTIDO` (
  `idEstado_partido` INT NOT NULL AUTO_INCREMENT,
  `Estado_estado_partido` VARCHAR(20) NULL,
  PRIMARY KEY (`idEstado_partido`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`JORNADAS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`JORNADAS` (
  `idJornadas` INT NOT NULL AUTO_INCREMENT,
  `fecha_jornadas` DATE NOT NULL,
  `idCampos` INT NOT NULL,
  `goles_local_jornadas` INT NULL,
  `goles_visita_jornadas` INT NULL,
  `hora_jornadas` TIME NOT NULL,
  `idEquipos_local` INT NOT NULL,
  `idEquipos_visita` INT NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  `idEstado_partido` INT NOT NULL,
  PRIMARY KEY (`idJornadas`, `idEquipos_local`, `idEquipos_visita`, `idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_Jornadas_Campos1_idx` (`idCampos` ASC),
  INDEX `fk_JORNADAS_EQUIPOS1_idx` (`idEquipos_local` ASC),
  INDEX `fk_JORNADAS_EQUIPOS2_idx` (`idEquipos_visita` ASC),
  INDEX `fk_JORNADAS_CAMPEONATO1_idx` (`idCampeonato` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  INDEX `fk_JORNADAS_ESTADO_PARTIDO1_idx` (`idEstado_partido` ASC),
  CONSTRAINT `fk_Jornadas_Campos1`
    FOREIGN KEY (`idCampos`)
    REFERENCES `p_polideportivo`.`CAMPOS` (`idCampos`)
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
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JORNADAS_CAMPEONATO1`
    FOREIGN KEY (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JORNADAS_ESTADO_PARTIDO1`
    FOREIGN KEY (`idEstado_partido`)
    REFERENCES `p_polideportivo`.`ESTADO_PARTIDO` (`idEstado_partido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLA_POSICIONES_FUTBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLA_POSICIONES_FUTBOL` (
  `idTabla_Posiciones_Futbol` INT NOT NULL AUTO_INCREMENT,
  `Lugar_tabla_posiciones_futbol` INT NOT NULL,
  `partidos_jugados_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `partidos_ganados_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `partidos_empatados_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `goles_a_favor_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `partidos_perdidos_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `goles_en_contra_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `Diferencia_goles_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `Puntos_tabla_posiciones_futbol` INT NULL DEFAULT 0,
  `Fecha_inicio_tabla_posiciones_futbol` DATE NULL,
  `Fecha_finalizacion_tabla_posiciones_futbol` DATE NULL,
  `idEquipos` INT NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idTabla_Posiciones_Futbol`, `idEquipos`, `idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_Tabla_Posiciones_Futbol_Equipos1_idx` (`idEquipos` ASC),
  INDEX `fk_TABLA_POSICIONES_FUTBOL_CAMPEONATO1_idx` (`idCampeonato` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_Tabla_Posiciones_Futbol_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TABLA_POSICIONES_FUTBOL_CAMPEONATO1`
    FOREIGN KEY (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`POSICION_JUGADOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`POSICION_JUGADOR` (
  `id_pogjug` INT NOT NULL AUTO_INCREMENT,
  `posicion_posicionjugador` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id_pogjug`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLAS_POSICIONES_BASKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLAS_POSICIONES_BASKET` (
  `idTablas_posiciones_basket` INT NOT NULL AUTO_INCREMENT,
  `lugar_tabla_posiciones_basket` INT NOT NULL,
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
  `idEquipos` INT NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idTablas_posiciones_basket`, `idEquipos`, `idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_Tablas_posiciones_basket_Equipos1_idx` (`idEquipos` ASC),
  INDEX `fk_TABLAS_POSICIONES_BASKET_CAMPEONATO1_idx` (`idCampeonato` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_Tablas_posiciones_basket_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TABLAS_POSICIONES_BASKET_CAMPEONATO1`
    FOREIGN KEY (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
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
  `descripcion_jugadoresregistro` VARCHAR(50) NULL,
  `idEquipos` INT NOT NULL,
  `idJugadores` INT NOT NULL,
  `id_pogjug` INT NOT NULL,
  PRIMARY KEY (`id_jugreg`, `idEquipos`),
  INDEX `fk_jugadores_registro_Equipos1_idx` (`idEquipos` ASC),
  INDEX `fk_jugadores_registro_Jugadores1_idx` (`idJugadores` ASC),
  INDEX `fk_JUGADORES_REGISTRO_POSICION_JUGADOR1_idx` (`id_pogjug` ASC),
  CONSTRAINT `fk_jugadores_registro_Equipos1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_jugadores_registro_Jugadores1`
    FOREIGN KEY (`idJugadores`)
    REFERENCES `p_polideportivo`.`JUGADORES` (`idJugadores`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_JUGADORES_REGISTRO_POSICION_JUGADOR1`
    FOREIGN KEY (`id_pogjug`)
    REFERENCES `p_polideportivo`.`POSICION_JUGADOR` (`id_pogjug`)
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
  `idEquipos` INT NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idTabla_Posiciones_Voleibol`, `idEquipos`, `idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_TABLAS_POSICIONES_VOLEIBOL_EQUIPOS1_idx` (`idEquipos` ASC),
  INDEX `fk_TABLAS_POSICIONES_VOLEIBOL_CAMPEONATO1_idx` (`idCampeonato` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_TABLAS_POSICIONES_VOLEIBOL_EQUIPOS1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TABLAS_POSICIONES_VOLEIBOL_CAMPEONATO1`
    FOREIGN KEY (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TABLA_POSICIONES_BEISBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TABLA_POSICIONES_BEISBOL` (
  `idtabla_posiciones_beisbol` INT NOT NULL AUTO_INCREMENT,
  `lugar_tabla_posiciones_beisbol` INT NULL,
  `juegos_jugados_tabla_posiciones_beisbol` INT NULL,
  `juegos_ganados_tabla_posiciones_beisbol` INT NULL,
  `juegos_perdidos_tabla_posiciones_beisbol` INT NULL,
  `pct_tabla_posiciones_beisbol` DECIMAL NULL,
  `puntos_tabla_posiciones_beisbol` INT NULL,
  `racha_tabla_posiciones_beisbol` VARCHAR(7) NULL,
  `casa_tabla_posiciones_beisbol` VARCHAR(8) NULL,
  `ruta_tabla_posiciones_beisbol` VARCHAR(8) NULL,
  `idEquipos` INT NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idtabla_posiciones_beisbol`, `idEquipos`, `idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_TABLA_POSICIONES_BEISBOL_EQUIPOS1_idx` (`idEquipos` ASC),
  INDEX `fk_TABLA_POSICIONES_BEISBOL_CAMPEONATO1_idx` (`idCampeonato` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_TABLA_POSICIONES_BEISBOL_EQUIPOS1`
    FOREIGN KEY (`idEquipos`)
    REFERENCES `p_polideportivo`.`EQUIPOS` (`idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_TABLA_POSICIONES_BEISBOL_CAMPEONATO1`
    FOREIGN KEY (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`CAMPEONATO` (`idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPO_ANOTACIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPO_ANOTACIONES` (
  `idtipo_anotaciones` INT NOT NULL AUTO_INCREMENT,
  `clase_tipo_anotaciones` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idtipo_anotaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`ANOTACIONES_REGISTRO_JUGADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`ANOTACIONES_REGISTRO_JUGADORES` (
  `idanotacion_registro_jugadores` INT NOT NULL AUTO_INCREMENT,
  `puntos_anotaciones_registro_jugadores` INT NOT NULL,
  `idtipo_anotaciones` INT NOT NULL,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  `idJornadas` INT NOT NULL,
  `idEquipos_local` INT NOT NULL,
  `idEquipos_visita` INT NOT NULL,
  `idCampeonato1` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idanotacion_registro_jugadores`, `idtipo_anotaciones`, `id_jugreg`, `idEquipos`, `idJornadas`, `idEquipos_local`, `idEquipos_visita`, `idCampeonato1`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_ANOTACIONES_REGISTRO_JUGADORES_TIPO_ANOTACIONES1_idx` (`idtipo_anotaciones` ASC),
  INDEX `fk_ANOTACIONES_REGISTRO_JUGADORES_JUGADORES_REGISTRO1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  INDEX `fk_ANOTACIONES_REGISTRO_JUGADORES_JORNADAS1_idx` (`idJornadas` ASC, `idEquipos_local` ASC, `idEquipos_visita` ASC, `idCampeonato1` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_ANOTACIONES_REGISTRO_JUGADORES_TIPO_ANOTACIONES1`
    FOREIGN KEY (`idtipo_anotaciones`)
    REFERENCES `p_polideportivo`.`TIPO_ANOTACIONES` (`idtipo_anotaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANOTACIONES_REGISTRO_JUGADORES_JUGADORES_REGISTRO1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ANOTACIONES_REGISTRO_JUGADORES_JORNADAS1`
    FOREIGN KEY (`idJornadas` , `idEquipos_local` , `idEquipos_visita` , `idCampeonato1` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`JORNADAS` (`idJornadas` , `idEquipos_local` , `idEquipos_visita` , `idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`TIPO_AMONESTACIONES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`TIPO_AMONESTACIONES` (
  `idtipo_amonestaciones` INT NOT NULL AUTO_INCREMENT,
  `clase_tipo_amonestaciones` VARCHAR(35) NOT NULL,
  PRIMARY KEY (`idtipo_amonestaciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`AMONESTACIONES_REGISTRO_JUGADORES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`AMONESTACIONES_REGISTRO_JUGADORES` (
  `idamonestaciones_registro_jugadores` INT NOT NULL AUTO_INCREMENT,
  `puntos_amonestaciones_registro_jugadores` INT NOT NULL,
  `idtipo_amonestaciones` INT NOT NULL,
  `id_jugreg` INT NOT NULL,
  `idEquipos` INT NOT NULL,
  `idJornadas` INT NOT NULL,
  `idEquipos_local` INT NOT NULL,
  `idEquipos_visita` INT NOT NULL,
  `idCampeonato1` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idamonestaciones_registro_jugadores`, `idtipo_amonestaciones`, `id_jugreg`, `idEquipos`, `idJornadas`, `idEquipos_local`, `idEquipos_visita`, `idCampeonato1`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_AMONESTACIONES_REGISTRO_JUGADORES_TIPO_AMONESTACIONES1_idx` (`idtipo_amonestaciones` ASC),
  INDEX `fk_AMONESTACIONES_REGISTRO_JUGADORES_JUGADORES_REGISTRO1_idx` (`id_jugreg` ASC, `idEquipos` ASC),
  INDEX `fk_AMONESTACIONES_REGISTRO_JUGADORES_JORNADAS1_idx` (`idJornadas` ASC, `idEquipos_local` ASC, `idEquipos_visita` ASC, `idCampeonato1` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_AMONESTACIONES_REGISTRO_JUGADORES_TIPO_AMONESTACIONES1`
    FOREIGN KEY (`idtipo_amonestaciones`)
    REFERENCES `p_polideportivo`.`TIPO_AMONESTACIONES` (`idtipo_amonestaciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AMONESTACIONES_REGISTRO_JUGADORES_JUGADORES_REGISTRO1`
    FOREIGN KEY (`id_jugreg` , `idEquipos`)
    REFERENCES `p_polideportivo`.`JUGADORES_REGISTRO` (`id_jugreg` , `idEquipos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AMONESTACIONES_REGISTRO_JUGADORES_JORNADAS1`
    FOREIGN KEY (`idJornadas` , `idEquipos_local` , `idEquipos_visita` , `idCampeonato1` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`JORNADAS` (`idJornadas` , `idEquipos_local` , `idEquipos_visita` , `idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`REGLAS_FUTBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`REGLAS_FUTBOL` (
  `idreglas_futbol` INT NOT NULL AUTO_INCREMENT,
  `nombre_reglas_futbol` VARCHAR(45) NULL,
  `descripcion_reglas_futbol` VARCHAR(1000) NULL,
  `DEPORTE_idDeporte` INT NOT NULL,
  PRIMARY KEY (`idreglas_futbol`, `DEPORTE_idDeporte`),
  INDEX `fk_REGLAS_FUTBOL_DEPORTE1_idx` (`DEPORTE_idDeporte` ASC),
  CONSTRAINT `fk_REGLAS_FUTBOL_DEPORTE1`
    FOREIGN KEY (`DEPORTE_idDeporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`REGLAS_BASKET`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`REGLAS_BASKET` (
  `idreglas_basket` INT NOT NULL AUTO_INCREMENT,
  `nombre_reglas_basket` VARCHAR(45) NULL,
  `descripcion_reglas_basket` VARCHAR(255) NULL,
  `DEPORTE_idDeporte` INT NOT NULL,
  PRIMARY KEY (`idreglas_basket`, `DEPORTE_idDeporte`),
  INDEX `fk_REGLAS_BASKET_DEPORTE1_idx` (`DEPORTE_idDeporte` ASC),
  CONSTRAINT `fk_REGLAS_BASKET_DEPORTE1`
    FOREIGN KEY (`DEPORTE_idDeporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`REGLAS_VOLEIBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`REGLAS_VOLEIBOL` (
  `idreglas_voleibol` INT NOT NULL AUTO_INCREMENT,
  `nombre_reglas_voleibol` VARCHAR(45) NULL,
  `descipcion_reglas_voleibol` VARCHAR(1000) NULL,
  `DEPORTE_idDeporte` INT NOT NULL,
  PRIMARY KEY (`idreglas_voleibol`, `DEPORTE_idDeporte`),
  INDEX `fk_REGLAS_VOLEIBOL_DEPORTE1_idx` (`DEPORTE_idDeporte` ASC),
  CONSTRAINT `fk_REGLAS_VOLEIBOL_DEPORTE1`
    FOREIGN KEY (`DEPORTE_idDeporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`REGLAS_BEISBOL`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`REGLAS_BEISBOL` (
  `idreglas_beisbol` INT NOT NULL AUTO_INCREMENT,
  `nombre_reglas_beisbol` VARCHAR(45) NULL,
  `descripcion_reglas_beisbol` VARCHAR(255) NULL,
  `DEPORTE_idDeporte` INT NOT NULL,
  PRIMARY KEY (`idreglas_beisbol`, `DEPORTE_idDeporte`),
  INDEX `fk_REGLAS_BEISBOL_DEPORTE1_idx` (`DEPORTE_idDeporte` ASC),
  CONSTRAINT `fk_REGLAS_BEISBOL_DEPORTE1`
    FOREIGN KEY (`DEPORTE_idDeporte`)
    REFERENCES `p_polideportivo`.`DEPORTE` (`idDeporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`CAMPO_TIPO_DEPORTE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`CAMPO_TIPO_DEPORTE` (
  `idCampos` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  PRIMARY KEY (`idCampos`, `idTipo_Deporte`),
  INDEX `fk_CAMPO_TIPO_DEPORTE_CAMPOS1_idx` (`idCampos` ASC),
  INDEX `fk_CAMPO_TIPO_DEPORTE_TIPOS_DEPORTE1_idx` (`idTipo_Deporte` ASC),
  CONSTRAINT `fk_CAMPO_TIPO_DEPORTE_CAMPOS1`
    FOREIGN KEY (`idCampos`)
    REFERENCES `p_polideportivo`.`CAMPOS` (`idCampos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CAMPO_TIPO_DEPORTE_TIPOS_DEPORTE1`
    FOREIGN KEY (`idTipo_Deporte`)
    REFERENCES `p_polideportivo`.`TIPOS_DEPORTE` (`idTipo_Deporte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `p_polideportivo`.`registro_arbitro_jornada`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `p_polideportivo`.`registro_arbitro_jornada` (
  `idArbitro` INT NOT NULL,
  `idTipo_Arbitro` INT NOT NULL,
  `idJornadas` INT NOT NULL,
  `idEquipos_local` INT NOT NULL,
  `idEquipos_visita` INT NOT NULL,
  `idCampeonato` INT NOT NULL,
  `idTipo_Deporte` INT NOT NULL,
  `idDeporte` INT NOT NULL,
  `idTipo_campeonato` INT NOT NULL,
  PRIMARY KEY (`idArbitro`, `idTipo_Arbitro`, `idJornadas`, `idEquipos_local`, `idEquipos_visita`, `idCampeonato`, `idTipo_Deporte`, `idDeporte`, `idTipo_campeonato`),
  INDEX `fk_registro_arbitro_jornada_ARBITRO1_idx` (`idArbitro` ASC, `idTipo_Arbitro` ASC),
  INDEX `fk_registro_arbitro_jornada_JORNADAS1_idx` (`idJornadas` ASC, `idEquipos_local` ASC, `idEquipos_visita` ASC, `idCampeonato` ASC, `idTipo_Deporte` ASC, `idDeporte` ASC, `idTipo_campeonato` ASC),
  CONSTRAINT `fk_registro_arbitro_jornada_ARBITRO1`
    FOREIGN KEY (`idArbitro` , `idTipo_Arbitro`)
    REFERENCES `p_polideportivo`.`ARBITRO` (`idArbitro` , `idTipo_Arbitro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registro_arbitro_jornada_JORNADAS1`
    FOREIGN KEY (`idJornadas` , `idEquipos_local` , `idEquipos_visita` , `idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    REFERENCES `p_polideportivo`.`JORNADAS` (`idJornadas` , `idEquipos_local` , `idEquipos_visita` , `idCampeonato` , `idTipo_Deporte` , `idDeporte` , `idTipo_campeonato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




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


 -- DEPENDENCIAS --
-- Dependencia de `p_jornada` y `p_campeonatos`
ALTER TABLE CAMPEONATO ADD CONSTRAINT cu_nombre UNIQUE(nombre_campeonato);

-- Dependencia de procedimiento `p_jugadores`
ALTER TABLE USUARIOS ADD CONSTRAINT cu_user UNIQUE(user_usuarios);


-- Es necesario realizar esta modificacion en el campo de la tabla
-- Workbench por si solo no permitia definir el tipo de dato `TIMESTAMP`
ALTER TABLE BITACORA_LOGIN MODIFY fecha_bitacora TIMESTAMP;

-- --------------------------------------------------------------------------------------
?-- PROCEDIMIENTOS A TABLAS PRINCIPALES --


-- Jugadores -- (YA)

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




DELIMITER //				
CREATE PROCEDURE p_entrenadores(
IN i_nombre VARCHAR(45),	IN i_apellidos VARCHAR(45), 
IN i_edad INT(11), 		IN i_direccion VARCHAR(45), 
IN i_telefono VARCHAR(12), 	IN i_mail VARCHAR(45), 
IN i_deporte INT, 		IN i_user VARCHAR(16), 
IN i_pass VARCHAR(30), 		IN i_estado VARCHAR(1),
OUT o_bit INT(1))
BEGIN
	DECLARE t_iuser, p_iuser INT;
    
	SELECT idUsuarios INTO p_iuser
	FROM USUARIOS
	WHERE 
		 user_usuarios = i_user AND pass_usuarios = i_pass;
	IF p_iuser IS NULL THEN
		INSERT INTO USUARIOS (user_usuarios, pass_usuarios, Tipo_usuarios, estado_usuarios)
			VALUES (i_user, i_pass, 'E',i_estado);
		SELECT idUsuarios INTO t_iuser
		FROM USUARIOS
		WHERE 
			user_usuarios = i_user;
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



-- ARBITRO -- (YA)
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


-- EMPLEADOS -- (YA)
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


-- Procedimiento jornadas (YA)
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

call ingresar_deporte(5,1); -- futbol 5
call ingresar_deporte(11,1); -- futbol 11
call ingresar_deporte(5,2); -- basket 5
call ingresar_deporte(6,3); -- voli 6 
call ingresar_deporte(9,4); -- beisbol 9

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

-- JEFFERSON AGREGRARA UN TRIRGGER  (EN DESAROLLO, `BEISBOL, VOLEIBOL`) --

delimiter //
CREATE TRIGGER upd_tables_pos
AFTER INSERT ON JORNADAS
FOR EACH ROW
BEGIN
	DECLARE t_partidos, t_golesL, t_golesV, t_deporte INT;
    DECLARE t_parJug, t_parGan, t_parEmpate, t_parPerdi INT;
    DECLARE t_equipoL, t_equipoV, t_puntos INT;
	DECLARE t_anotaGana, t_anotaPerdi, t_difA INT;
    -- 
	SELECT idTipo_Deporte, idEquipos_local, idEquipos_visita, 
    goles_local_jornadas, goles_visita_jornadas
    INTO t_deporte, t_equipoL, t_equipoV, t_golesL, t_golesV
    FROM JORNADAS
    WHERE idJornadas = (SELECT MAX(idJornadas) FROM JORNADAS);
	--
    CASE t_deporte
	 	WHEN '1' THEN
			SELECT partidos_jugados_tabla_posiciones_futbol, partidos_ganados_tabla_posiciones_futbol,
            partidos_empatados_tabla_posiciones_futbol, goles_a_favor_tabla_posiciones_futbol, 
            partidos_perdidos_tabla_posiciones_futbol, goles_en_contra_tabla_posiciones_futbol,
            Puntos_tabla_posiciones_futbol
            INTO t_parJug, t_parGan, t_parEmpate, t_anotaGana, t_parPerdi, t_anotaPerdi, t_puntos
            FROM TABLA_POSICIONES_FUTBOL
            WHERE idEquipos = t_equipoL;
            SET t_parJug = t_parJug + 1;
            -- 
            IF t_golesL = t_golesV THEN
				SET t_parEmpate = t_parEmpate + 1;
                SET t_anotaGana = t_anotaGana + t_golesL;
			ELSEIF t_golesL < t_golesV THEN
				SET t_parPerdi = t_parPerdi + 1;
                SET t_anotaPerdi = t_anotaPerdi + t_golesV;
			ELSEIF t_golesL > t_golesV THEN
				SET t_parGan = t_parGan + 1;
                SET t_anotaGana = t_anotaGana + t_golesL;
            END IF;
            SET t_difA = t_anotaGana - t_anotaPerdi;
            SET t_puntos = (t_parGan * 3) + t_parEmpate;
			-- 
			UPDATE TABLA_POSICIONES_FUTBOL
	 		SET partidos_jugados_tabla_posiciones_futbol = t_parJug, 
            partidos_ganados_tabla_posiciones_futbol = t_parGan, 
            partidos_empatados_tabla_posiciones_futbol = t_parEmpate, 
            goles_a_favor_tabla_posiciones_futbol = t_anotaGana,
            partidos_perdidos_tabla_posiciones_futbol = t_parPerdi,
            goles_en_contra_tabla_posiciones_futbol = t_anotaPerdi,
            Diferencia_goles_tabla_posiciones_futbol = t_difA,
            Puntos_tabla_posiciones_futbol = t_puntos
			WHERE idEquipos = t_equipoL;
			-- ------------------------------------------------
			SELECT partidos_jugados_tabla_posiciones_futbol, partidos_ganados_tabla_posiciones_futbol,
            partidos_empatados_tabla_posiciones_futbol, goles_a_favor_tabla_posiciones_futbol, 
            partidos_perdidos_tabla_posiciones_futbol, goles_en_contra_tabla_posiciones_futbol,
            Puntos_tabla_posiciones_futbol
            INTO t_parJug, t_parGan, t_parEmpate, t_anotaGana, t_parPerdi, t_anotaPerdi, t_puntos
            FROM TABLA_POSICIONES_FUTBOL
            WHERE idEquipos = t_equipoV;
            SET t_parJug = t_parJug + 1;
            -- 
            IF t_golesL = t_golesV THEN
				SET t_parEmpate = t_parEmpate + 1;
                SET t_anotaGana = t_anotaGana + t_golesV;
			ELSEIF t_golesV < t_golesL THEN
				SET t_parPerdi = t_parPerdi + 1;
                SET t_anotaPerdi = t_anotaPerdi + t_golesL;
			ELSEIF t_golesV > t_golesL THEN
				SET t_parGan = t_parGan + 1;
                SET t_anotaGana = t_anotaGana + t_golesV;
            END IF;
            SET t_difA = t_anotaGana - t_anotaPerdi;
            SET t_puntos = (t_parGan * 3) + t_parEmpate;
			-- 
			UPDATE TABLA_POSICIONES_FUTBOL
	 		SET partidos_jugados_tabla_posiciones_futbol = t_parJug, 
            partidos_ganados_tabla_posiciones_futbol = t_parGan, 
            partidos_empatados_tabla_posiciones_futbol = t_parEmpate, 
            goles_a_favor_tabla_posiciones_futbol = t_anotaGana,
            partidos_perdidos_tabla_posiciones_futbol = t_parPerdi,
            goles_en_contra_tabla_posiciones_futbol = t_anotaPerdi,
            Diferencia_goles_tabla_posiciones_futbol = t_difA,
            Puntos_tabla_posiciones_futbol = t_puntos
			WHERE idEquipos = t_equipoV;
            
		WHEN 2 THEN
		 	SELECT partidos_jugados_tablas_posiciones_basket, partidos_ganados_tablas_posiciones_basket,
            partidos_empatados_tablas_posiciones_basket, puntos_a_favor_tablas_posiciones_basket, 
            partidos_perdidos_tablas_posiciones_basket, puntos_en_contra_tablas_posiciones_basket,
			puntos_tablas_posiciones_basket
			INTO t_parJug, t_parGan, t_parEmpate, t_anotaGana, t_parPerdi, t_anotaPerdi, t_puntos
            FROM TABLAS_POSICIONES_BASKET
		 	WHERE idEquipos = t_equipoV;
            SET t_parJug = t_parJug + 1;
            -- 
			IF t_golesL = t_golesV THEN
			 	SET t_parEmpate = t_parEmpate + 1;
				SET t_anotaGana = t_anotaGana + t_golesV;
			ELSEIF t_golesV < t_golesL THEN
			 	SET t_parPerdi = t_parPerdi + 1;
				SET t_anotaPerdi = t_anotaPerdi + t_golesL;
			ELSEIF t_golesV > t_golesL THEN
			 	SET t_parGan = t_parGan + 1;
				SET t_anotaGana = t_anotaGana + t_golesV;
			END IF;
			SET t_difA = t_anotaGana - t_anotaPerdi;
			SET t_puntos = (t_parGan * 2); -- + t_parEmpate;
			UPDATE TABLAS_POSICIONES_BASKET
			SET partidos_jugados_tablas_posiciones_basket = t_parJug,
			partidos_ganados_tablas_posiciones_basket = t_parGan, 
            partidos_empatados_tablas_posiciones_basket = t_parEmpate,
			partidos_perdidos_tablas_posiciones_basket = t_parPerdi,
			puntos_a_favor_tablas_posiciones_basket = t_anotaGana,
			puntos_en_contra_tablas_posiciones_basket = t_anotaPerdi,
			Diferencia_tablas_posiciones_basket = t_difA, 
            puntos_tablas_posiciones_basket = t_puntos
			WHERE idEquipos = t_equipoV;
            -- ----------------------------------------------------------------------
			SELECT partidos_jugados_tablas_posiciones_basket, partidos_ganados_tablas_posiciones_basket,
            partidos_empatados_tablas_posiciones_basket, puntos_a_favor_tablas_posiciones_basket, 
            partidos_perdidos_tablas_posiciones_basket, puntos_en_contra_tablas_posiciones_basket,
			puntos_tablas_posiciones_basket
			INTO t_parJug, t_parGan, t_parEmpate, t_anotaGana, t_parPerdi, t_anotaPerdi, t_puntos
            FROM TABLAS_POSICIONES_BASKET
		 	WHERE idEquipos = t_equipoL;
            SET t_parJug = t_parJug + 1;
            -- 
			IF t_golesL = t_golesV THEN
			 	SET t_parEmpate = t_parEmpate + 1;
				SET t_anotaGana = t_anotaGana + t_golesL;
			ELSEIF t_golesL < t_golesV THEN
			 	SET t_parPerdi = t_parPerdi + 1;
				SET t_anotaPerdi = t_anotaPerdi + t_golesV;
			ELSEIF t_golesL > t_golesV THEN
			 	SET t_parGan = t_parGan + 1;
				SET t_anotaGana = t_anotaGana + t_golesL;
			END IF;
			SET t_difA = t_anotaGana - t_anotaPerdi;
            SET t_puntos = (t_parGan * 2); -- + t_parEmpate;
			UPDATE TABLAS_POSICIONES_BASKET
			SET partidos_jugados_tablas_posiciones_basket = t_parJug,
			partidos_ganados_tablas_posiciones_basket = t_parGan, 
            partidos_empatados_tablas_posiciones_basket = t_parEmpate,
			partidos_perdidos_tablas_posiciones_basket = t_parPerdi,
			puntos_a_favor_tablas_posiciones_basket = t_anotaGana,
			puntos_en_contra_tablas_posiciones_basket = t_anotaPerdi,
			Diferencia_tablas_posiciones_basket = t_difA, 
            puntos_tablas_posiciones_basket = t_puntos
			WHERE idEquipos = t_equipoL;
            -- 
            
        -- WHEN 3 THEN
		-- 	SELECT SYSDATE();
		-- WHEN 4 THEN
		-- 	SELECT SYSDATE();
	END CASE;
     -- IF NEW.amount < 0 THEN
     --    SET NEW.amount = 0;
     -- ELSEIF NEW.amount > 100 THEN
     --    SET NEW.amount = 100;
	-- END IF;
END;//
delimiter ;
