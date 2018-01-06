#!/bin/bash
#
# Default firewall for Linux boxes
#

open_ports=("tcp:22")

iptables -F
iptables -t nat -F

iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

for port in $open_ports; do
	params=(${port//:/ })
	echo "iptables -A INPUT -p ${params[0]} --dport ${params[1]} -j ACCEPT"
done

