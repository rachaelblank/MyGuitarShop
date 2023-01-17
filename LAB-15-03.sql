DROP PROCEDURE IF EXISTS item_total;

DELIMITER //

CREATE PROCEDURE item_total
(
	item_id_param	INT
)
RETURNS DECIMAL(9,2)
BEGIN
  DECLARE total_amount_var DECIMAL(9,2);
    
  SELECT discount_price(item_id) * quantity
  INTO   item_total_var
  FROM   order_items
  WHERE  item_id = item_id_param;
    
  RETURN item_total_var;
END//