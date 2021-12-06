#!/bin/bash

# Sourcing
source /usr/local/natinst/tools/versioning_utils.sh
setup_versioning_env
versioning_call make

# Setup 
MOD_DIR="$(basename $(pwd))"
/sbin/rmmod "${MOD_DIR}.ko"
dmesg -c

# First time
/sbin/insmod "${MOD_DIR}.ko"
/sbin/modinfo "${MOD_DIR}.ko"
/sbin/rmmod "${MOD_DIR}.ko"

echo "No params"
dmesg | grep Hello
dmesg | grep string
dmesg | grep int
dmesg | grep Goodbye
dmesg -c >> NULL

# Second time
/sbin/insmod "${MOD_DIR}.ko" my_string=xyz my_int=10
/sbin/rmmod "${MOD_DIR}.ko"

echo "string=xyz int=10"
dmesg | grep Hello
dmesg | grep string
dmesg | grep int
dmesg | grep Goodbye
dmesg -c >> NULL


# Third time
echo "string=abc int=20"
/sbin/insmod "${MOD_DIR}.ko" my_string=abc my_int=20
/sbin/rmmod "${MOD_DIR}.ko"

dmesg | grep Hello
dmesg | grep string
dmesg | grep int
dmesg | grep Goodbye
dmesg -c >> NULL

ip addr show | grep 130.113.11.24
