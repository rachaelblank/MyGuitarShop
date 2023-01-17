DROP PROCEDURE IF EXISTS discount_price;

DELIMITER //

CREATE PROCEDURE discount_price
(
  item_id_param	INT
)
RETURNS DECIMAL(9,2)
BEGIN
  DECLARE discount_price_var DECIMAL(9,2);
    
  SELECT item_price - discount_amount
  INTO   discount_price_var
  FROM   order_items
  WHERE  item_id = item_id_param;
    
  RETURN discount_price_var;
END//