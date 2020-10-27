#!/bin/bash

# Adapt this path for your needs
BASE_PATH="$PWD"
OVPN_DATA="$BASE_PATH/data"

echo
echo "### Generate clinet cert"
echo
echo "# Clientname"
echo "Enter the clients name:"
read CLIENTNAME

docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENTNAME nopass

echo
echo "# Retrieve config"
echo

if [ ! -d $BASE_PATH/clients ] ; then
  mkdir $BASE_PATH/clients
fi

docker run -v $OVPN_DATA:/etc/openvpn --rm kylemanna/openvpn ovpn_getclient $CLIENTNAME > "$BASE_PATH/clients/$CLIENTNAME.ovpn"

echo
echo "# Wrote config to folder clients"
echo
echo "### DONE"
