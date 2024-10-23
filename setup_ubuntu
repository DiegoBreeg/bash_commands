#!/bin/bash

# Styles
NO_FORMAT="\033[0m"
C_ORANGE1="\033[38;5;214m"
C_BLUE="\033[38;5;12m"
C_GREEN1="\033[38;5;46m"
C_GREEN3="\033[38;5;34m"
C_YELLOW="\033[38;5;11m"
C_RED="\033[38;5;9m"

installed_softwares=()

execute_command()
{
    local date

    date=$(date +"%d-%m-%Y %H:%M:%S")

    printf "${C_YELLOW}[$date]${NO_FORMAT} ${C_ORANGE1}Running: $1...${NO_FORMAT}\n"

    eval "$1"

    if [ $? -eq 0 ]; then
        printf "${C_YELLOW}[$date]${NO_FORMAT} ${C_GREEN3}Success: The command was executed successfully!${NO_FORMAT}\n"        
    else
        printf "${C_RED}[$date]${NO_FORMAT} ${C_GREEN3}Error: The command failed!${NO_FORMAT}\n"
    fi
}

# OS Update
execute_command "sudo apt update"
execute_command "sudo apt upgrade -y"

## Softwares Installation

#git installation
execute_command "sudo apt install -y git"

installed_softwares+=("git")

#gh installation
gh_installation_commands="(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) && \
sudo mkdir -p -m 755 /etc/apt/keyrings && \
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null && \
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg && \
echo \"deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main\" | \
sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
sudo apt update && \
sudo apt install gh -y"

execute_command "$gh_installation_commands"
execute_command "sudo apt update\
    && sudo apt install gh"

installed_softwares+=("gh")

#docker installation
docker_commands="sudo apt-get update && \
sudo apt-get install -y ca-certificates curl && \
sudo install -m 0755 -d /etc/apt/keyrings && \
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc && \
sudo chmod a+r /etc/apt/keyrings/docker.asc && \
echo \"deb [arch=\$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
\$(. /etc/os-release && echo \"\$VERSION_CODENAME\") stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
sudo apt-get update"

execute_command "$docker_commands"
execute_command "sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin"
installed_softwares+=("docker")

#installed software versions
for software in "${installed_softwares[@]}"; do
    if command -v "$software" &> /dev/null; then
        version=$($software --version)
        printf "${C_BLUE}%-60s${NO_FORMAT} ${C_GREEN3}Installed: %s${NO_FORMAT}\n" "[$software]" "$version"
    else
        printf "${C_BLUE}%-60s${NO_FORMAT} ${C_RED}Not installed${NO_FORMAT}\n" "[$software]"
    fi
done
