# Bash Scripts for System Setup

This repository contains a collection of bash scripts to help with the installation and setup of various software packages and dependencies on popular Linux distributions.

## Docker Installation

The `docker_installation.sh` script automates the installation of Docker and Docker Compose along with their dependencies on CentOS, Ubuntu, Debian, openSUSE, and Alpine. It detects the Linux distribution and installs the appropriate packages based on the detected OS.

To use the script, follow these steps:
1. Make the script executable by running `chmod +x docker_installation.sh`.
2. Run the script using `./docker_installation.sh`.
3. The script will automatically install Docker and Docker Compose on your system.

## Docker Aliases

The `docker_aliases.sh` script provides a collection of useful aliases for Docker and Docker Compose commands. It allows you to use shorter and more intuitive commands for common Docker operations.

To use the aliases, follow these steps:
1. Make sure you have Docker and Docker Compose installed on your system.
2. Source the `docker_aliases.sh` file in your shell environment by running `. ./docker_aliases.sh` or by adding it to your shell startup file (e.g., `.bashrc` or `.bash_profile`).
3. Once the aliases are sourced, you can use the shortened commands in your terminal. For example, instead of typing `docker container ls`, you can simply type `dci`.

## Nginx Installation

The `nginx_installation.sh` script automates the installation of the Nginx web server on CentOS, Ubuntu, Debian, openSUSE, and Alpine. It installs Nginx and starts the service automatically.

To use the script, follow these steps:
1. Make the script executable by running `chmod +x nginx_installation.sh`.
2. Run the script using `./nginx_installation.sh`.
3. The script will install Nginx and start the service on your system.

## Apache Installation

The `apache_installation.sh` script automates the installation of the Apache HTTP Server on CentOS, Ubuntu, Debian, openSUSE, and Alpine. It installs Apache and starts the service automatically.

To use the script, follow these steps:
1. Make the script executable by running `chmod +x apache_installation.sh`.
2. Run the script using `./apache_installation.sh`.
3. The script will install Apache and start the service on your system.

## MariaDB Installation

The `mariadb_installation.sh` script automates the installation of MariaDB on CentOS, Ubuntu, Debian, openSUSE, and Alpine. It installs MariaDB and starts the service automatically.

To use the script, follow these steps:
1. Make the script executable by running `chmod +x mariadb_installation.sh`.
2. Run the script using `./mariadb_installation.sh`.
3. The script will install MariaDB and start the service on your system.

## MySQL Installation

The `mysql_installation.sh` script automates the installation of MySQL on CentOS, Ubuntu, Debian, openSUSE, and Alpine. It installs MySQL and starts the service automatically.

To use the script, follow these steps:
1. Make the script executable by running `chmod +x mysql_installation.sh`.
2. Run the script using `./mysql_installation.sh`.
3. The script will install MySQL and start the service on your system.

## Certbot Installation

The `certbot_installation.sh` script automates the installation of Certbot on CentOS, Ubuntu, Debian, openSUSE, and Alpine. It installs Certbot and its dependencies for usage with Nginx, Apache, or standalone mode.

To use the script, follow these steps:
1. Make the script executable by running `chmod +x certbot_installation.sh`.
2. Run the script using `./certbot_installation.sh`.
3. The script will install Certbot and its dependencies on your system.

Please note that these scripts are provided as a starting point and may need modifications to fit your specific requirements. Always review and test scripts before running them in a production environment.

