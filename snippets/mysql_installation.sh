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

# Function to install MySQL on CentOS
install_mysql_centos() {
    # Install MySQL
    sudo yum install -y mysql-server

    # Start and enable MySQL service
    sudo systemctl start mysqld
    sudo systemctl enable mysqld

    # Secure MySQL installation
    sudo mysql_secure_installation
}

# Function to install MySQL on Ubuntu
install_mysql_ubuntu() {
    # Install MySQL
    sudo apt-get update
    sudo apt-get install -y mysql-server

    # Start and enable MySQL service
    sudo systemctl start mysql
    sudo systemctl enable mysql

    # Secure MySQL installation
    sudo mysql_secure_installation
}

# Function to install MySQL on Debian
install_mysql_debian() {
    # Install MySQL
    sudo apt-get update
    sudo apt-get install -y mysql-server

    # Start and enable MySQL service
    sudo systemctl start mysql
    sudo systemctl enable mysql

    # Secure MySQL installation
    sudo mysql_secure_installation
}

# Function to install MySQL on openSUSE
install_mysql_opensuse() {
    # Install MySQL
    sudo zypper -n install mysql-server

    # Start and enable MySQL service
    sudo systemctl start mysql
    sudo systemctl enable mysql

    # Secure MySQL installation
    sudo mysql_secure_installation
}

# Function to install MySQL on Alpine
install_mysql_alpine() {
    # Install MySQL
    sudo apk update
    sudo apk add mysql mysql-client

    # Start and enable MySQL service
    sudo rc-service mysql start
    sudo rc-update add mysql

    # Secure MySQL installation
    sudo mysql_secure_installation
}

# Main installation logic based on the detected OS
case $OS in
    "centos")
        install_mysql_centos
        ;;
    "ubuntu")
        install_mysql_ubuntu
        ;;
    "debian")
        install_mysql_debian
        ;;
    "opensuse")
        install_mysql_opensuse
        ;;
    "alpine")
        install_mysql_alpine
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

# Success message
echo "MySQL installed successfully."
