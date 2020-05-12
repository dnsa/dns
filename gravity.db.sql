insert into"group"(id,name)values(1,'dnsb');
insert into adlist(id,address)values(0,'https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/dbl.txt');
insert into adlist_by_group(adlist_id,group_id)values(0,1);
insert into client(id,ip)values(0,'xxx');
delete from client_by_group;
insert into client_by_group(client_id,group_id)values(0,1);
insert into domainlist(id,type,domain)values(0,3,'.');
insert into domainlist(id,type,domain)values(1,3,'apple|icloud|ocsp|appkonthai');
