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


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
