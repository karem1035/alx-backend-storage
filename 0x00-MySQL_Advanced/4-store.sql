-- Decrease quantity of item in store when order is created
CREATE TRIGGER item_decrease AFTER INSERT ON orders FOR EACH ROW 
UPDATE items SET quantity = quantity - NEW.number WHERE name = NEW.item_name
