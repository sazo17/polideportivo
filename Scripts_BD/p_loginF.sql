-- Dependencia SINO FUNCIONA ES PORQUE YA HA SIDO APLICADA
ALTER TABLE USUARIOS ADD CONSTRAINT cu_user UNIQUE(user_usuarios);


DELIMITER //
CREATE  PROCEDURE `p_login`(IN user VARCHAR(16)
, IN pass VARCHAR(30)
, OUT o_tipo_usuarios VARCHAR(1) 
, OUT o_estado_usuarios VARCHAR(1)
, OUT o_idUsuarios INT(11))
BEGIN
	-- Declaracion de variables
	DECLARE s_tipo,  s_estado VARCHAR(1);
	DECLARE s_id INT(11);
    	-- Declaracion de Exception
	DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	SET o_tipo_usuarios = 0, o_estado_usuarios = 0, o_idUsuarios = 0;
        
	-- Busqueda de usuario y contrasenia.
	-- Se asigna en una variable cuando se encuentra.
	SELECT Tipo_usuarios, estado_usuarios, idUsuarios
	INTO s_tipo, s_estado, s_id
	FROM USUARIOS
	WHERE 
		user_usuarios = user AND
		pass_usuarios = pass;
        
	-- Validacion de `s_id` si no es NULL puede proceder
	IF s_id IS NOT NULL THEN
		-- Asignacion de los valores recibidos en las variables
		-- de salida.
		SET o_tipo_usuarios = s_tipo;
		SET o_estado_usuarios = s_estado;
		SET o_idUsuarios = s_id;
        	-- Inserta datos en la `bitacora_login` 
		-- inserta la fecha actual + hora y el host = hostname@puerto
		INSERT INTO BITACORA_LOGIN (usuario_bitacora, 
		fecha_bitacora, host_bitacora) 
		VALUES (s_id, SYSDATE(), USER());
		COMMIT;
	ELSE 
		-- Retonra valores asignados en variables cuando `s_id`es NULL
		SET o_tipo_usuarios = 'N';
		SET o_estado_usuarios = 'N';
		SET o_idUsuarios = 0;				  
    END IF;
END//
DELIMITER ;