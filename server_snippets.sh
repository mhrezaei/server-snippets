#!/bin/bash

shopt -s expand_aliases

# Load Docker aliases
source docker/docker_aliases.sh

# Multiple Helpers Report
mhr() {
  echo "Available Helper Functions:"
  echo "--------------------------"
  echo "d       - Docker aliases help"
  # Add more helper functions here in the future
}

# Add more aliases or functions for other software or packages here
# For example:
# alias k='kubectl'
# alias kc='kubectl create'
# alias kd='kubectl delete'
# ...
