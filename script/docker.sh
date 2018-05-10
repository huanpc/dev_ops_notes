#!/usr/bin/env sh
out() {
    echo "$1"
    exit 1
}

quit() {
    result=$?
    if [ "$result" != "0" ]; then
        echo "Setup failed!"
    fi
    exit $result
}

is_docker_installed(){
    DOCKER=$(which docker)
    if [ "$?" = "0" ]; then
        out "docker has already existed!!"
    fi
}

add_2_user_group(){
    echo "Add $USER to docker group ..."
    sudo usermod -a -G docker $USER    
}

install_docker(){
    wget -qO- https://get.docker.com/ | sh
    if [ "$?" != "0" ]; then
        out "Failed to install docker"
    else
        add_2_user_group
    fi
}

echo "Installing docker ..."
trap "quit" EXIT
is_docker_installed
install_docker
echo "Done!"