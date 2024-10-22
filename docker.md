
## iniciar container docker com imagem do mysql e configura volume dos dados
docker run --name mysql -e MYSQL_ROOT_PASSWORD=35264100 -d -p 3306:3306 -v mysqlvolume:/var/www/database mysql

## acessar o terminal do mysql
docker exec -it mysql /bin/bash