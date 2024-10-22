#!/bin/bash

database()
{
    source ~/commands/shell_style.sh

echo -e "${Green}Mysql Docker image configuration${Color_Off}"

echo -e "${Yellow}container name: ${Color_Off}"
read container_name
tput cuu 2
tput ed

echo -e "${Yellow}external port: ${Color_Off}"
read port
tput cuu 2
tput ed

echo -e "${Yellow}root password: ${Color_Off}"
read root_password
tput cuu 2
tput ed

if docker run --name ${container_name} -e MYSQL_ROOT_PASSWORD=$root_password -d -p $port:3306 -v mysqlvolume:/var/www/database mysql; then
    echo -e "${Green}Container ${container_name} is running at${Color_Off}"
    printf "%-20s: ${Yellow}%s${Color_Off}\n" "Connection link" "localhost:${port}"
    printf "%-20s: ${Yellow}%s${Color_Off}\n" "User" "root"
    printf "%-20s: ${Yellow}%s${Color_Off}\n" "Password" "${root_password}"
    printf "%-20s: ${Yellow}%s${Color_Off}\n" "Volume path" "/var/www/database"    
else
    echo -e "${Red}Failed to run the container. Please check the error above. ${Color_Off}"
    exit 1
fi
}

database