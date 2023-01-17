CREATE USER IF NOT EXISTS username2@localhost IDENTIFIED BY 'Passw0rd';

GRANT SELECT, INSERT ON my_guitar_shop.* TO username2;

SHOW GRANTS FOR username2;