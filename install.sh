sudo add-apt-repository -y ppa:certbot/certbot
sudo apt update
sudo apt -y full-upgrade
sudo apt -y autoremove --purge
sudo apt clean
curl -sSL https://install.pi-hole.net|bash
echo|sudo tee /etc/pihole/adlists.list
echo release/v5.0|sudo tee /etc/pihole/ftlbranch
pihole checkout core release/v5.0
pihole checkout web release/v5.0
grep -Rl "(cast(strftime('%s', 'now') as int))" /etc/.pihole|xargs sudo sed -i "s/(cast(strftime('%s', 'now') as int))/-11111333366665/g"
echo IGNORE_LOCALHOST=yes|sudo tee -a /etc/pihole/pihole-FTL.conf
sudo rm /etc/pihole/gravity.db
sudo sqlite3 /etc/pihole/gravity.db</etc/.pihole/advanced/Templates/gravity.db.sql
sudo sqlite3 /etc/pihole/gravity.db<gravity.db.sql
bash etc.hosts.sh|sudo tee /etc/hosts
pihole -g
pihole -a -p
sudo apt -y install iptables-persistent certbot php-curl php-mbstring
sudo iptables -A INPUT -p udp --dport 53 -m string --algo bm --hex-string '|0000FF0001|' -m recent --set --name dns
sudo iptables -A INPUT -p udp --dport 53 -m string --algo bm --hex-string '|0000FF0001|' -m recent --name dns --rcheck --seconds 60 --hitcount 3 -j DROP
sudo netfilter-persistent save
sudo systemctl enable netfilter-persistent
sudo systemctl stop lighttpd
sudo certbot certonly --standalone --register-unsafely-without-email --agree-tos -d aaaaaa
sudo cat /etc/letsencrypt/live/aaaaaa/cert.pem /etc/letsencrypt/live/aaaaaa/privkey.pem|sudo tee /etc/letsencrypt/live/aaaaaa/cert-priv.pem
sudo sed -i 's/server.port.*80/server.port=443\nssl.engine="enable"\nssl.pemfile="\/etc\/letsencrypt\/live\/aaaaaa\/cert-priv.pem"\nssl.ca-file="\/etc\/letsencrypt\/live\/aaaaaa\/chain.pem"/g' /etc/lighttpd/lighttpd.conf
sudo systemctl start lighttpd
echo "<?php header('Location:https://aaaaaa/admin/queries.php?client='.\$_SERVER[REMOTE_ADDR]);"|sudo tee /var/www/html/a.php
sudo wget -O /var/www/html/b.php https://raw.githubusercontent.com/joshdick/miniProxy/master/miniProxy.php
sudo sed -i "2iif(\$_SERVER[REMOTE_ADDR]!=gethostbyname('cccccc.duckdns.org'))die;" /var/www/html/b.php
sudo sed -i 's/<title>miniProxy/<title>Web Browser/g' /var/www/html/b.php
sudo sed -i 's/Welcome to miniProxy!/Web Browser/g' /var/www/html/b.php
sudo sed -i 's/miniProxy can be directly invoked like this: //g' /var/www/html/b.php
sudo sed -i 's/https:\/\/example.net/https:\/\/aaaaaa\/b.php/g' /var/www/html/b.php
sudo sed -i 's/Or, you can simply enter a URL below://g' /var/www/html/b.php
sudo sed -i 's/Proxy It!/Browser/g' /var/www/html/b.php
echo '0 18 * * * bash update.sh|sudo tee /var/www/html/a.txt'|sudo tee /var/spool/cron/crontabs/dns
sudo crontab -u dns -e
sudo sed -i 's/certbot -q renew/certbot -q renew;sudo cat \/etc\/letsencrypt\/live\/aaaaaa\/cert.pem \/etc\/letsencrypt\/live\/aaaaaa\/privkey.pem|sudo tee \/etc\/letsencrypt\/live\/aaaaaa\/cert-priv.pem/g' /etc/cron.d/certbot
