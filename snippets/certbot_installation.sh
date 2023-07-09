#!/bin/bash

# Check the Linux distribution
if [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS=$ID
elif [[ $(grep -qi "centos" /etc/os-release) ]]; then
    OS="centos"
else
    echo "Unsupported operating system."
    exit 1
fi

# Function to install Certbot on CentOS
install_certbot_centos() {
    # Install Certbot
    sudo yum install -y certbot

    # Install Certbot plugins for Nginx and Apache
    sudo yum install -y certbot-nginx certbot-apache
}

# Function to install Certbot on Ubuntu
install_certbot_ubuntu() {
    # Install Certbot
    sudo apt-get update
    sudo apt-get install -y certbot

    # Install Certbot plugins for Nginx and Apache
    sudo apt-get install -y python3-certbot-nginx python3-certbot-apache
}

# Function to install Certbot on Debian
install_certbot_debian() {
    # Install Certbot
    sudo apt-get update
    sudo apt-get install -y certbot

    # Install Certbot plugins for Nginx and Apache
    sudo apt-get install -y python3-certbot-nginx python3-certbot-apache
}

# Function to install Certbot on openSUSE
install_certbot_opensuse() {
    # Install Certbot
    sudo zypper -n install certbot

    # Install Certbot plugins for Nginx and Apache
    sudo zypper -n install python3-certbot-nginx python3-certbot-apache
}

# Function to install Certbot on Alpine
install_certbot_alpine() {
    # Install Certbot
    sudo apk update
    sudo apk add certbot

    # Install Certbot plugins for Nginx and Apache
    sudo apk add py3-certbot-nginx py3-certbot-apache
}

# Main installation logic based on the detected OS
case $OS in
    "centos")
        install_certbot_centos
        ;;
    "ubuntu")
        install_certbot_ubuntu
        ;;
    "debian")
        install_certbot_debian
        ;;
    "opensuse")
        install_certbot_opensuse
        ;;
    "alpine")
        install_certbot_alpine
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

# Success message
echo "Certbot installed successfully."
echo "Please refer to the Certbot documentation for instructions on how to use it with Nginx, Apache, or standalone mode."