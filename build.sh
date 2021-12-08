#!/bin/bash

NOCOLOR='\033[0m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGRAY='\033[0;37m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'

CMAKE_BUILD_DIR="../out"
PROJECT_NAME="Isolation"
BUILD_TYPE="Debug"

configure() {
    echo -e "configuring cmake..."
    cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=1 -S . -B $CMAKE_BUILD_DIR 
}

build() {
    echo -e "building..."
    cmake --build $CMAKE_BUILD_DIR || (configure && cmake --build $CMAKE_BUILD_DIR)
}

run() {
    echo -e "running..."
    $CMAKE_BUILD_DIR/bin/$PROJECT_NAME || (build && $CMAKE_BUILD_DIR/bin/$PROJECT_NAME)
}

clean_all() {
    echo -e "cleaning..."
    rm -rf $CMAKE_BUILD_DIR/*
    rm -rf $CMAKE_BUILD_DIR/.*
}

while true
do
echo -e "\n \
Build type -> ${GREEN}${BUILD_TYPE}${NOCOLOR}\n \
(${RED}1${NOCOLOR}) configure cmake, \
(${RED}2${NOCOLOR}) build, \
(${RED}3${NOCOLOR}) run, \
(${RED}4${NOCOLOR}) clean all, \
(${GREEN}q${NOCOLOR}) exit \
"
read -n 1 -s input
case $input in
    1)
        configure
        ;;
    2)
        build
        ;;
    3)
        run
        ;;
    4)
        clean_all
        ;;
    *)
        exit
        ;;
esac
done