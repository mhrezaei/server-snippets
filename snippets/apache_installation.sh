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

# Function to install Apache on CentOS
install_apache_centos() {
    # Install Apache
    sudo yum install -y httpd

    # Start and enable Apache service
    sudo systemctl start httpd
    sudo systemctl enable httpd
}

# Function to install Apache on Ubuntu
install_apache_ubuntu() {
    # Install Apache
    sudo apt-get update
    sudo apt-get install -y apache2

    # Start and enable Apache service
    sudo systemctl start apache2
    sudo systemctl enable apache2
}

# Function to install Apache on Debian
install_apache_debian() {
    # Install Apache
    sudo apt-get update
    sudo apt-get install -y apache2

    # Start and enable Apache service
    sudo systemctl start apache2
    sudo systemctl enable apache2
}

# Function to install Apache on openSUSE
install_apache_opensuse() {
    # Install Apache
    sudo zypper -n install apache2

    # Start and enable Apache service
    sudo systemctl start apache2
    sudo systemctl enable apache2
}

# Function to install Apache on Alpine
install_apache_alpine() {
    # Install Apache
    sudo apk update
    sudo apk add apache2

    # Start and enable Apache service
    sudo rc-service apache2 start
    sudo rc-update add apache2
}

# Main installation logic based on the detected OS
case $OS in
    "centos")
        install_apache_centos
        ;;
    "ubuntu")
        install_apache_ubuntu
        ;;
    "debian")
        install_apache_debian
        ;;
    "opensuse")
        install_apache_opensuse
        ;;
    "alpine")
        install_apache_alpine
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

# Success message
echo "Apache installed successfully."