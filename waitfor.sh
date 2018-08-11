#!/bin/bash

waitfor() {
    while true; do
        echo "Thank you for being lazy"
        echo "COMMAND: $2"
        echo "WATCHED FILES: $(echo $1)"
        if inotifywait -e modify $(echo $1); then
            echo "EXECUTING COMMAND"    
            $2  
            sleep 5
            clear
        fi  
    done
}

