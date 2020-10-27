#!/bin/bash

echo
echo "### Setup OpvenVPN Server"

# Adapt this path for your needs
BASE_PATH="$PWD"
OVPN_DATA="$BASE_PATH/data"
SERVER_NAME="mycorp.adriano.fyi"

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$SERVER_NAME

docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki

echo
echo "### Done"
