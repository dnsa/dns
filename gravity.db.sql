insert into"group"(id,name)values(1,'dnsb');
insert into adlist(id,address)values(0,'https://raw.githubusercontent.com/ookangzheng/dbl-oisd-nl/master/dbl.txt');
insert into adlist_by_group(adlist_id,group_id)values(0,1);
insert into client(id,ip)values(0,'xxx');
delete from client_by_group;
insert into client_by_group(client_id,group_id)values(0,1);
insert into domainlist(id,type,domain)values(0,3,'.');
insert into domainlist(id,type,domain)values(1,3,'apple|icloud|ocsp|appkonthai');
insert into domainlist(id,type,domain)values(3,2,'^(albert|gsa)\.apple\.com$|^(bag|play|buy|p[0-9]{1,2}-buy|sf-api-token-service|init|iosapps|su)\.itunes\.apple\.com$|^(s|apps|is[0-9]-ssl)\.mzstatic\.com$|^(amp-api-search-edge|api)\.apps\.apple\.com$|^(init|[0-9]{1,3}-courier)\.push\.apple\.com$|^(init|profile|static|identity)\.ess\.apple\.com$|^setup\.icloud\.com$|^gateway-asset\.icloud-content\.com$|^edge-[0-9]{3}\.(hkhkg|sgsin)\.icloud-content\.com$');
