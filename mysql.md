## cria usuário no banco de dados
CREATE USER 'diego'@'localhost' IDENTIFIED BY '35264100';

## dá privilégios ao ususuario
GRANT ALL PRIVILEGES ON *.* TO diego@localhost;

##
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
