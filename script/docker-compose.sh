#!/usr/bin/env sh
VERSION=1.21.1

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
    if [ "$?" = "1" ]; then
        out "Install docker firstly!"
    fi
}

is_docker_compose_installed(){
    DOCKER_COMPOSE=$(which docker-compose)
    if [ "$?" = "0" ]; then
        out "docker-compose has already existed!"
    fi
}

install_docker_compose(){
    sudo curl -L https://github.com/docker/compose/releases/download/$VERSION/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    if [ "$?" != "0" ]; then
        out "Failed to install docker-compose"
    fi
}

trap "quit" EXIT
echo "is docker existed?"
is_docker_installed
echo "is docker-compose existed?"
is_docker_compose_installed
echo "install docker-compose"
install_docker_compose
echo "Done!"