#!/bin/bash
#
# Default firewall for Linux boxes
#

# list of open ports
open_ports=("tcp:22")

# flush tables
iptables -F
iptables -t nat -F

# accept everything on loopback
iptables -A INPUT -i lo -j ACCEPT

# accept incoming connections related to locally initiated ones 
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT


# open ports
for port in $open_ports; do
	params=(${port//:/ })
	echo "iptables -A INPUT -p ${params[0]} --dport ${params[1]} -j ACCEPT"
done

# set policies
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
