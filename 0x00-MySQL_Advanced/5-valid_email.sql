
-- Documentation:
-- This trigger sets the valid_email column of a row to 0 if the email is updated.
-- It's used to check if an email is valid or not.
DELIMITER //
CREATE TRIGGER email_validation
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
	IF NEW.email <> OLD.email THEN
		SET NEW.valid_email = 0;
	END IF;
END; //
DELIMITER ;