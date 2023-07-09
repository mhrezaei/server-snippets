#!/bin/bash

# Docker aliases
alias d='docker'
alias di='docker images'
alias dps='docker ps'
alias dci='docker container ls --all'
alias dce='docker container exec'
alias dlogs='docker logs'
alias drmi='docker rmi'
alias drm='docker rm'
alias drmf='docker rm -f'
alias dn='docker network'
alias dnc='docker network create'
alias dnr='docker network rm'
alias dv='docker volume'
alias dvc='docker volume create'
alias dvr='docker volume rm'

# Docker monitoring aliases
alias dmstats='docker stats'
alias dmtop='docker top'
alias dmlogs='docker logs -f'

# Docker container aliases
alias dcrun='docker container run'
alias dcstart='docker container start'
alias dcstop='docker container stop'
alias dckill='docker container kill'
alias dcpause='docker container pause'
alias dcunpause='docker container unpause'
alias dcrestart='docker container restart'
alias dcp='docker container prune'

# Docker image aliases
alias dicreate='docker image create'
alias dipull='docker image pull'
alias dipush='docker image push'
alias dibuild='docker image build'
alias ditag='docker image tag'
alias diinspect='docker image inspect'
alias dip='docker image prune'

# Docker network aliases
alias dnetls='docker network ls'
alias dnetinspect='docker network inspect'

# Docker volume aliases
alias dvolcreate='docker volume create'
alias dvolinspect='docker volume inspect'
alias dvolls='docker volume ls'
alias dvolrm='docker volume rm'

# Docker Compose aliases
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose run'
alias dcev='docker-compose exec'

# Method to display help menu
d() {
  echo "Docker Aliases Help:"
  echo "---------------------"
  echo "Containers:"
  echo "------------"
  echo "d          - Docker CLI"
  echo "dcrun      - Create and start a new Docker container"
  echo "dcstart    - Start an existing Docker container"
  echo "dcstop     - Stop a running Docker container"
  echo "dckill     - Forcefully kill a running Docker container"
  echo "dcpause    - Pause a running Docker container"
  echo "dcunpause  - Unpause a paused Docker container"
  echo "dcrestart  - Restart a Docker container"
  echo "dci        - List all Docker containers"
  echo "dce        - Execute command in a running Docker container"
  echo "dlogs      - Show logs of a Docker container"
  echo "drm        - Remove a stopped Docker container"
  echo "drmf       - Forcefully remove a Docker container"
  echo "dcp        - Remove all stopped containers"

  echo ""
  echo "Images:"
  echo "---------"
  echo "di         - List Docker images"
  echo "dicreate   - Create a new Docker image"
  echo "dipull     - Pull a Docker image from a registry"
  echo "dipush     - Push a Docker image to a registry"
  echo "dibuild    - Build a Docker image from a Dockerfile"
  echo "ditag      - Tag a Docker image"
  echo "diinspect  - Inspect a Docker image"
  echo "drmi       - Remove a Docker image"
  echo "dip        - Remove unused Docker images"

  echo ""
  echo "Networks:"
  echo "-----------"
  echo "dn         - Docker network CLI"
  echo "dnc        - Create a Docker network"
  echo "dnr        - Remove a Docker network"
  echo "dnetls     - List Docker networks"
  echo "dnetinspect- Inspect a Docker network"

  echo ""
  echo "Volumes:"
  echo "----------"
  echo "dv         - Docker volume CLI"
  echo "dvc        - Create a Docker volume"
  echo "dvr        - Remove a Docker volume"
  echo "dvolls     - List Docker volumes"
  echo "dvolinspect- Inspect a Docker volume"

  echo ""
  echo "Monitoring:"
  echo "-------------"
  echo "dmstats    - Display real-time statistics of containers"
  echo "dmtop      - Display the running processes of a container"
  echo "dmlogs     - Show live logs of a container"

  echo ""
  echo "Docker Compose Aliases:"
  echo "-----------------------"
  echo "dc         - Docker Compose CLI"
  echo "dcu        - Start Docker Compose services"
  echo "dcd        - Stop Docker Compose services"
  echo "dcr        - Run a one-time command in a Docker Compose service"
  echo "dcev       - Execute command in a running Docker Compose service"
}

# Set the aliases to be persistent
echo "source ~/.bashrc" >> ~/.bash_profile
source ~/.bashrc