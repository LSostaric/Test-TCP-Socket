#!/bin/ksh -p

if [ "$1" == "help" ] ; then

echo "Usage: Test-TCP-Socket.ksh destination-addr destination-port source-addr [expected-output unexpected-output]"
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
fi


host="$1"
port="$2"
source="$3"

if [ -z "$4" ] ; then

expected="O.K. Success."

else
expected="$4"

fi

if [ -z "$5" ] ; then

unexpected="Could not connect to $host on port $port."

else
unexpected="$5"

fi

output="$(telnet -b "$source" "$host" "$port" 2>&1 <<EOF
EOF
)"

if [ $(echo "$output" | grep -ic "Connected") -eq 0 ] ; then
        echo "$unexpected"
    else
        echo "$expected"
fi

exit 0
