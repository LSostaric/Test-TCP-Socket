#!/bin/ksh -p

if [ -z "$1" ] ; then
        echo "The server address has to be specified as the first parameter. Terminating..."
        exit 1
    elif [ -z "$2" ] ; then
        echo "You have to specify the port as the second parameter. Terminating..."
        exit 2
    elif [ -z "$3" ] ; then
        echo "You have to specify the source address. Terminating..."
        exit 3
fi

host="$1"
port="$2"
source="$3"

output="$(telnet -b "$source" "$host" "$port" 2>&1 <<EOF
EOF
)"

if [ $(echo "$output" | grep -ic "Connected") -eq 0 ] ; then
        echo "Could not connect to $host on port $port."
    else
        echo "O.K. Success."
fi

exit 0
