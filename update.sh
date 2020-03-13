date
sudo apt update
sudo apt -y full-upgrade
sudo apt -y autoremove --purge
sudo apt clean
/usr/local/bin/pihole -up
grep -Rl "(cast(strftime('%s', 'now') as int))" /etc/.pihole|xargs sudo sed -i "s/(cast(strftime('%s', 'now') as int))/-11111333366665/g"
bash etc.hosts.sh|sudo tee /etc/hosts
/usr/local/bin/pihole -g
/usr/local/bin/pihole restartdns
/usr/local/bin/pihole arpflush
sudo sed -i 's/server.port.*80/server.port=443\nssl.engine="enable"\nssl.pemfile="\/etc\/letsencrypt\/live\/aaaaaa\/cert-priv.pem"\nssl.ca-file="\/etc\/letsencrypt\/live\/aaaaaa\/chain.pem"/g' /etc/lighttpd/lighttpd.conf
sudo systemctl restart lighttpd
