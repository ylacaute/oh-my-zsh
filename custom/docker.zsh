
function memoDocker {
    echo "MEMO DOCKER"
    echo
    echo "Connect into a running container with bash"
    echo " $ sudo docker exec -i -t <container_id> bash"
    echo
    echo "Attach the console to a running container"
    echo " $ docker attach <container_id>"
    echo
    echo "Common option of docker run"
    echo " -i : Keep STDIN open even if not attached"
    echo " -t : Allocate a pseudo-tty"
    echo
    echo "To be continued..."
}

# Show all containers
alias dockps='docker ps -a'

# Stop all containers
alias dockstop='docker stop $(docker ps -a -q)'

# Remove all containers
alias dockrm='docker rm $(docker ps -a -q)'

# Show all images
alias dockimg='docker images'

# Delete all images
alias dockrmi='docker rmi $(docker images -q)'
