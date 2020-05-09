sudo iptables -P INPUT DROP
sudo iptables -P FORWARD DROP
sudo iptables -P OUTPUT DROP
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT
sudo iptables -A INPUT -p tcp -m multiport --sports 80,443 -j ACCEPT
sudo iptables -A INPUT -p udp -m multiport --ports 53 -j ACCEPT
sudo iptables -A OUTPUT -p tcp --sport ssh -j ACCEPT
sudo iptables -A OUTPUT -p tcp -m multiport --dports 80,443 -j ACCEPT
sudo iptables -A OUTPUT -p udp -m multiport --ports 53 -j ACCEPT
