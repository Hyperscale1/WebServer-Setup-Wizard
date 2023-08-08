# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1

RED='\033[0;31m'
CYAN='\033[0;36m'
PURPLE='\033[0;35m'
NC='\033[0m' # No Color
echo -e "${RED}Starting Installer...${NC}"
echo -e "${RED}Made by Luca https://github.com/Hyperscale1${NC}"
sleep 5 
echo -e "${PURPLE}Select a node version${NC}"
read nodev
echo -e "${PURPLE}Selected node version is $nodev.${NC} ${RED}Is this correct? (yes/no)${NC}"
read correct
if [ $correct = "yes" ]
then
    echo -e "${PURPLE}Installing node version $nodev${NC}"
    sleep 1
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
    sleep 2
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
    sleep 1
    nvm install $nodev
    sleep 1
    nvm use $nodev
    sleep 1
    if [ $? -eq 0 ]; then
        echo -e "${CYAN}Node version $nodev installed${NC}"
    else
        echo -e "${RED}Node version $nodev failed to install${NC}"
        exit
    fi
    echo -e "${PURPLE}Installing NGINX${NC}"
    sleep 5
    sudo sudo apt update -y
    sudo apt install nginx -y
    if [ $? -eq 0 ]; then
        echo -e "${CYAN}NGINX has successfully installed${NC}"
    else
        echo -e "${RED}NGINX failed to install${NC}"
        exit
    fi
    sleep 5
    echo -e "${PURPLE}MYSQL is installing${NC}"
    sleep 1
    sudo apt install mysql-server -y
    sleep 1
    echo -e "${PURPLE}Input MYSQL Password (Remember this password. It can't easily be retreived)${NC}"
    read mysqlpass 
    sleep 1
    sudo mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY '$mysqlpass';" -e "FLUSH PRIVILEGES;"
    

    if [ $? -eq 0 ]; then
        echo -e "${CYAN}MYSQL has successfully installed without a password.${NC}"
    else
        echo -e "${RED}MYSQL failed to install${NC}"
        exit
    fi
    sleep 1
    echo -e "${PURPLE}Installing Certbot for NGINX${NC}"
    sudo apt install certbot python3-certbot-nginx -y
    if [ $? -eq 0 ]; then
        echo -e "${CYAN}Certbot has successfully installed${NC}"
    else
        echo -e "${RED}Certbot failed to install${NC}"
        exit
    fi

    echo -e "${CYAN}All services have been installed!${NC}"
    exit
fi

if [ $correct = "no" ]
then
    echo -e "${RED}Please restart the installer and select the correct node version.${NC}"
    exit
fi
# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1
# Made By Luca https://github.com/Hyperscale1
