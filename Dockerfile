FROM ubuntu:22.04

RUN "apt update -y"
RUN "apt install wireguard -y"

# COPY wireguard files to wireguard directory
# OR generate new ones and print to user

RUN "systemctl start wg-quick@wg0"

# RUN sed command to allow packet forwarding
# by editing the /etc/sysctl.conf file
# and removing the comment of the line: #net.ipv4.ip_forward=1

RUN "sysctl -p"
RUN "sysctl --system"

# RUN setup to forward the packets to the reverse proxy running
# on the VPN (home server)

# By default drop traffic
# sudo iptables -P FORWARD DROP
#
# # Allow traffic on specified ports
# sudo iptables -A FORWARD -i eth0 -o wg0 -p tcp --syn --dport 80 -m conntrack --ctstate NEW -j ACCEPT
# sudo iptables -A FORWARD -i eth0 -o wg0 -p tcp --syn --dport 443 -m conntrack --ctstate NEW -j ACCEPT
#
# # Allow traffic between wg0 and eth0
# sudo iptables -A FORWARD -i wg0 -o eth0 -m conntrack --cstate ESTABLISHED,RELATED -j ACCEPT
# sudo iptables -A FORWARD -i wg0 -o eth0 -m conntrack --cstate ESTABLISHED,RELATED -j ACCEPT
#
# # Forward traffic from eth0 to wg0 on specified ports
# sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNAT --to-destination 192.168.4.2
# sudo iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 443 -j DNAT --to-destination 192.168.4.2
#
# # Forward traffic back to eth0 from wg0 on specified ports
# sudo iptables -t nat -A POSTROUTING -o wg0 -p tcp --dport 80 -d 192.168.4.2 -j SNAT --to-source 192.168.4.1
# sudo iptables -t nat -A POSTROUTING -o wg0 -p tcp --dport 443 -d 192.168.4.2 -j SNAT --to-source 192.168.4.1

