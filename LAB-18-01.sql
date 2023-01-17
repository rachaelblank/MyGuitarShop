CREATE USER IF NOT EXISTS username1 IDENTIFIED BY 'Passw0rd';

GRANT SELECT, INSERT, UPDATE, DELETE ON my_guitar_shop.customers TO username1;
GRANT SELECT, INSERT, UPDATE, DELETE ON my_guitar_shop.addresses TO username1;
GRANT SELECT, INSERT, UPDATE, DELETE ON my_guitar_shop.orders TO username1;
GRANT SELECT, INSERT, UPDATE, DELETE ON my_guitar_shop.order_items TO username1;

GRANT SELECT ON my_guitar_shop.products TO username1;
GRANT SELECT ON my_guitar_shop.categories TO username1;

REVOKE GRANT OPTION FROM username1;

SHOW GRANTS FOR username1;

REVOKE DELETE ON my_guitar_shop.orders FROM username1;
REVOKE DELETE ON my_guitar_shop.order_items FROM username1;
