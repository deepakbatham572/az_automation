#!/bin/bash

# Define the servers
server1="10.233.232.103"
server2="10.4.42.18"
server3="10.4.45.100"

# Function to connect to a server
connect_to_server() {
    echo "Connecting to $1..."
    ssh $1
}

# Connect to server1
connect_to_server $server1

# Once connected to server1, connect to server2
if [ $? -eq 0 ]; then
    connect_to_server $server2
else
    echo "Failed to connect to $server1"
    exit 1
fi

# Once connected to server2, connect to server3
if [ $? -eq 0 ]; then
    connect_to_server $server3
else
    echo "Failed to connect to $server2"
    exit 1
fi

echo "All connections successful."
