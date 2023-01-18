#!/bin/bash

#This script outputs the IP address and Hostname of a machine 
a=$(ip a | grep 'noprefixroute dynamic ens192' | awk '{print $2}')
echo My IP is $a
