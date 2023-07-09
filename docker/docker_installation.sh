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

# Function to install Docker on CentOS
install_docker_centos() {
    # Install required dependencies
    sudo yum install -y yum-utils device-mapper-persistent-data lvm2

    # Configure Docker repository
    sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

    # Install Docker CE
    sudo yum install -y docker-ce docker-ce-cli containerd.io

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add the current user to the docker group
    sudo usermod -aG docker $USER
}

# Function to install Docker on Ubuntu
install_docker_ubuntu() {
    # Install required dependencies
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

    # Add Docker repository key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $UBUNTU_CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Install Docker CE
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add the current user to the docker group
    sudo usermod -aG docker $USER
}

# Function to install Docker on Debian
install_docker_debian() {
    # Install required dependencies
    sudo apt-get update
    sudo apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common

    # Add Docker repository key
    curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

    # Add Docker repository
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $VERSION_CODENAME stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

    # Install Docker CE
    sudo apt-get update
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add the current user to the docker group
    sudo usermod -aG docker $USER
}

# Function to install Docker on openSUSE
install_docker_opensuse() {
    # Install Docker
    sudo zypper -n install docker

    # Start and enable Docker service
    sudo systemctl start docker
    sudo systemctl enable docker

    # Add the current user to the docker group
    sudo usermod -aG docker $USER
}

# Function to install Docker on Alpine
install_docker_alpine() {
    # Install Docker
    sudo apk update
    sudo apk add docker

    # Start and enable Docker service
    sudo rc-service docker start
    sudo rc-update add docker

    # Add the current user to the docker group
    sudo adduser $USER docker
}

# Function to install Docker Compose
install_docker_compose() {
    # Install Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
}

# Main installation logic based on the detected OS
case $OS in
    "centos")
        install_docker_centos
        ;;
    "ubuntu")
        install_docker_ubuntu
        ;;
    "debian")
        install_docker_debian
        ;;
    "opensuse")
        install_docker_opensuse
        ;;
    "alpine")
        install_docker_alpine
        ;;
    *)
        echo "Unsupported operating system."
        exit 1
        ;;
esac

# Install Docker Compose
install_docker_compose

# Success message
echo "Docker and Docker Compose installed successfully."
echo "Please log out and log back in to use Docker without sudo."