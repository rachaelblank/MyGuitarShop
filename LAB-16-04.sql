SHOW VARIABLES LIKE 'event_scheduler';

SET GLOBAL event_scheduler = ON;

DROP EVENT IF EXISTS delete_older_than_one_week_audit;

DELIMITER // 

CREATE EVENT
delete_older_than_one_week_audit
ON SCHEDULE EVERY 1 DAY
STARTS current_timestamp
DO BEGIN
	DELETE from Products_Audit WHERE date_update < action_date (DAY, -7, curdate());
END // 

DROP EVENT delete_older_than_one_week_audit;