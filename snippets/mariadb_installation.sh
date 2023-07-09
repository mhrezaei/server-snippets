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

# Function to install MariaDB on CentOS
install_mariadb_centos() {
    # Install MariaDB
    sudo yum install -y mariadb-server

    # Start and enable MariaDB service
    sudo systemctl start mariadb
    sudo systemctl enable mariadb
}

# Function to install MariaDB on Ubuntu
install_mariadb_ubuntu() {
    # Install MariaDB
    sudo apt-get update
    sudo apt-get install -y mariadb-server

    # Start and enable MariaDB service
    sudo systemctl start mariadb
    sudo systemctl enable mariadb
}

# Function to install MariaDB on Debian
install_mariadb_debian() {
    # Install MariaDB
    sudo apt-get update
    sudo apt-get install -y mariadb-server

    # Start and enable MariaDB service
    sudo systemctl start mariadb
    sudo systemctl enable mariadb
}

# Function to install MariaDB on openSUSE
install_mariadb_opensuse() {
    # Install MariaDB
    sudo zypper -n install mariadb

    # Start and enable MariaDB service
    sudo systemctl start mariadb
    sudo systemctl enable mariadb
}

# Function to install MariaDB on Alpine
install_mariadb_alpine() {
    # Install MariaDB
    sudo apk update
    sudo apk add mariadb mariadb-client

    # Start and enable MariaDB service
    sudo rc-service mariadb start
    sudo rc-update add mariadb
}

# Main installation logic based on the detected OS
case $OS in
    "centos")
        install_mariadb_centos
        ;;
    "ubuntu")
        install_mariadb_ubuntu
        ;;
    "debian")
        install_mariadb_debian
        ;;
    "opensuse")
        install_mariadb_opensuse
        ;;
    "alpine")
        install_mariadb_alpine
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

# Success message
echo "MariaDB installed successfully."