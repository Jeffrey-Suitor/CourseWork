#!/bin/bash

# Sourcing
source /usr/local/natinst/tools/versioning_utils.sh
setup_versioning_env
versioning_call make

# Setup 
MOD_DIR="$(basename $(pwd))"
/sbin/rmmod "${MOD_DIR}.ko"
dmesg -c

# Actions
/sbin/insmod "${MOD_DIR}.ko"
/sbin/modinfo "${MOD_DIR}.ko"
/sbin/rmmod "${MOD_DIR}.ko"

# Display
ip addr show | grep 130.113.11.24
dmesg | grep Hello
dmesg | grep Goodbye

