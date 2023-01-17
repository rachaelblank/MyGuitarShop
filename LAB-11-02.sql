-- 2.
DROP DATABASE IF EXISTS my_web_db;
CREATE DATABASE my_web_db CHARSET utf8;
USE my_web_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS downloads;
DROP TABLE IF EXISTS products;

CREATE TABLE IF NOT EXISTS users (
	user_id 		INT		PRIMARY KEY		AUTO_INCREMENT,
    email_address	VARCHAR(100) NOT NULL,
	first_name		VARCHAR(45) NOT NULL,
    last_name		VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS products (
	product_id		INT PRIMARY KEY		AUTO_INCREMENT,
    product_name	VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS downloads (
	download_id		INT PRIMARY KEY		AUTO_INCREMENT,
    user_id			INT NOT NULL,
    download_date	DATETIME NOT NULL,
    file_name		VARCHAR(45) NOT NULL,
    product_id		INT NOT NULL,
    CONSTRAINT users_fk_downloads FOREIGN KEY (user_id)
		REFERENCES users (user_id),
	CONSTRAINT products_fk_downloads FOREIGN KEY (product_id)
		REFERENCES products (product_id)
) ENGINE = InnoDB;