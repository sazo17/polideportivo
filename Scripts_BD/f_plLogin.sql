DELIMITER //
CREATE PROCEDURE p_login(IN user VARCHAR(16)
, IN pass VARCHAR(30)
, OUT o_tipo_usuarios VARCHAR(1) 
, OUT o_estado_usuarios VARCHAR(1)
, OUT o_idUsuarios INT(11)
) 
BEGIN
	DECLARE s_tipo,  s_estado VARCHAR(1);
   DECLARE s_id INT(11);
    
   DECLARE CONTINUE HANDLER FOR SQLEXCEPTION 
	SET o_tipo_usuarios = 0, o_estado_usuarios = 0, o_idUsuarios = 0;
        
	SELECT Tipo_usuarios, estado_usuarios, idUsuarios
	INTO s_tipo, s_estado, s_id
	FROM USUARIOS
	WHERE 
		user_usuarios = user AND
      pass_usuarios = pass;
        -- SELECT s_id, s_estado, s_tipo;
        
   IF s_id IS NOT NULL THEN
		SET o_tipo_usuarios = s_tipo;
      SET o_estado_usuarios = s_estado;
      SET o_idUsuarios = s_id;
        
		INSERT INTO BITACORA_LOGIN (usuario_bitacora, 
      fecha_bitacora, host_bitacora) 
      VALUES (s_id, SYSDATE(), USER());
		-- COMMIT;
	ELSE 
		SET o_tipo_usuarios = 'N';
      SET o_estado_usuarios = 'N';
      SET o_idUsuarios = 0;
    
    END IF;
END//
DELIMITER ;

