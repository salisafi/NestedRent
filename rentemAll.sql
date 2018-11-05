CREATE USER 'root'@'localhost' IDENTIFIED BY 'Group8';

SHOW GRANTS FOR 'root'@'localhost';


INSERT INTO mysql.USER (Host, User, Password) VALUES ('localhost', 'root', password('Group8'));

select * from USER;

flush privileges;

CREATE USER  root@localhost IDENTIFIED BY 'Group8';

drop user 'root'@'localhost';

CREATE USER 'root'@'localhost';

CREATE USER 'sali'@'localhost' IDENTIFIED BY 'Group8';

GRANT ALL PRIVILEGES ON *.* TO 'sali'@'localhost' WITH GRANT OPTION;

SHOW GRANTS FOR 'root'@'localhost';   

CREATE USER 'root'@'localhost' IDENTIFIED BY'Group8';   

GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;


flush privileges;
 