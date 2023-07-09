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

# Function to install Nginx on CentOS
install_nginx_centos() {
    # Install Nginx
    sudo yum install -y epel-release
    sudo yum install -y nginx

    # Start and enable Nginx service
    sudo systemctl start nginx
    sudo systemctl enable nginx
}

# Function to install Nginx on Ubuntu
install_nginx_ubuntu() {
    # Install Nginx
    sudo apt-get update
    sudo apt-get install -y nginx

    # Start and enable Nginx service
    sudo systemctl start nginx
    sudo systemctl enable nginx
}

# Function to install Nginx on Debian
install_nginx_debian() {
    # Install Nginx
    sudo apt-get update
    sudo apt-get install -y nginx

    # Start and enable Nginx service
    sudo systemctl start nginx
    sudo systemctl enable nginx
}

# Function to install Nginx on openSUSE
install_nginx_opensuse() {
    # Install Nginx
    sudo zypper -n install nginx

    # Start and enable Nginx service
    sudo systemctl start nginx
    sudo systemctl enable nginx
}

# Function to install Nginx on Alpine
install_nginx_alpine() {
    # Install Nginx
    sudo apk update
    sudo apk add nginx

    # Start and enable Nginx service
    sudo rc-service nginx start
    sudo rc-update add nginx
}

# Main installation logic based on the detected OS
case $OS in
    "centos")
        install_nginx_centos
        ;;
    "ubuntu")
        install_nginx_ubuntu
        ;;
    "debian")
        install_nginx_debian
        ;;
    "opensuse")
        install_nginx_opensuse
        ;;
    "alpine")
        install_nginx_alpine
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

# Success message
echo "Nginx installed successfully."