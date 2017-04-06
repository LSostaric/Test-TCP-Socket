#!/bin/ksh -p

if [ "$1" == "help" ] ; then

echo "Usage: Test-TCP-Socket.ksh destination-addr destination-port source-addr expected-output [fail-message] [success-message]"
exit 0

fi

if [ -z "$1" ] ; then
        echo "The server address has to be specified as the first parameter. Terminating..."
        echo "Use Test-TCP-Socket.ksh help for usage."
        exit 1
    elif [ -z "$2" ] ; then
        echo "You have to specify the port as the second parameter. Terminating..."
        echo "Use Test-TCP-Socket.ksh help for usage."
        exit 2
    elif [ -z "$3" ] ; then
        echo "You have to specify the source address. Terminating..."
        echo "Use Test-TCP-Socket.ksh help for usage."
        exit 3
    elif [ -z "$4" ] ; then
        echo "You have to specify the output expected from the socket."
        echo "Use Test-TCP-Socket.ksh help for usage"
        exit 3
fi


host="$1"
port="$2"
source="$3"
expected="$4"

if [ -z "$5" ] ; then

fail="Could not connect to $host on port $port."

else
fail="$5"

fi

if [ -z "$6" ] ; then

success="O.K. Success."

else
success="$6"

fi

output="$(nc -s "$source" "$host" "$port" 2>&1 <<EOF
EOF
)"

if [ $(echo "$output" | grep -ic "$expected") -eq 0 ] ; then
        echo "$fail"
    else
        echo "$success"
fi

exit 0
