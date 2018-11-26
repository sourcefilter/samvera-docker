CREATE USER 'californica'@'%' IDENTIFIED BY 'californica';
GRANT ALL PRIVILEGES ON *.* TO 'californica'@'%';
CREATE USER 'ursus'@'%' IDENTIFIED BY 'ursus';
GRANT ALL PRIVILEGES ON *.* TO 'ursus'@'%';
FLUSH PRIVILEGES;
