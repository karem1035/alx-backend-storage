-- This script defines a stored procedure 'ComputeAverageScoreForUser' that computes and updates the average score for a user in the 'users' table.
-- The procedure takes an 'user_id' as input and computes the average score for the user with that id by querying the 'corrections' table.
-- The procedure uses an UPDATE statement to update the 'average_score' field in the 'users' table.
-- The procedure is called using the 'CALL' statement followed by the name of the procedure and the input argument.
DELIMITER //
DROP PROCEDURE IF EXISTS ComputeAverageScoreForUser;
CREATE PROCEDURE ComputeAverageScoreForUser(
	IN user_id INT
)
BEGIN
	UPDATE users
	SET average_score = (SELECT AVG(score) FROM corrections WHERE corrections.user_id = id)
	WHERE id = user_id;
END //


DELIMITER ;