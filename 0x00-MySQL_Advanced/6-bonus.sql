-- 0x00-MySQL_Advanced/6-bonus.sql
--
-- This file contains a stored procedure that adds a bonus correction to a project.
-- If the project doesn't exist, it creates it.
--
-- Parameters:
--   user_id (IN) - id of the user to add the correction to
--   project_name (IN) - name of the project to add the correction to
--   score (IN) - score of the correction
DELIMITER //

CREATE PROCEDURE AddBonus(
	IN user_id  INT,
	IN project_name VARCHAR(255),
	IN score INT
)
BEGIN
	DECLARE project_id INT;
	SELECT id INTO project_id
	FROM projects
	WHERE name = project_name;

	-- check if project exists
	IF project_id IS NULL THEN
		INSERT INTO projects (name) VALUES (project_name);
		SET project_id = LAST_INSERT_ID();
	END IF;
	
	-- Add correction
	INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END //

DELIMITER ;