DELIMITER //

-- AddBonus procedure
-- Add a bonus correction to a user for a project
-- Parameters:
--  - user_id: the user's id
--  - project_name: the name of the project
--  - score: the score of the correction
CREATE PROCEDURE AddBonus (
	IN user_id INT,
	IN project_name VARCHAR(255),
	IN score INT
)
BEGIN
	DECLARE project_id INT;  -- Declare a variable to store the project ID

	-- Try to get the project ID from the projects table
	SELECT id
	INTO project_id
	FROM projects
	WHERE name = project_name;

	-- If the project does not exist, insert it into the projects table
	IF project_id IS NULL THEN
		INSERT INTO projects (name) VALUES (project_name);
		-- Retrieve the ID of the newly inserted project
		SET project_id = LAST_INSERT_ID();
	END IF;

	-- Insert the bonus correction into the corrections table
	INSERT INTO corrections (user_id, project_id, score) VALUES (user_id, project_id, score);
END//

DELIMITER ;
