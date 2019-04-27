#!/bin/bash

# Run the python script that builds the command to do the mount, then run it

echo "ARGS"
echo $@
SCRIPT_OUT=$(build-ssh-mount-cmd.py $@)

if [ $? -gt 0 ]; then
  exit 1
else
  $SCRIPT_OUT
fi
