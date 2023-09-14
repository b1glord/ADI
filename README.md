## rAthena Auto Database Installer (Otomatik Database Yukleme)

### Kurulum ###
#ADI.sh isimli dosyayi rAthena sql-files dizinine kopyaliyoruz
```
cd ~/rAthena/sql-files
wget https://raw.githubusercontent.com/b1glord/ADI/master/customaccount.sql
wget https://raw.githubusercontent.com/b1glord/ADI/master/custom.sql
wget https://raw.githubusercontent.com/b1glord/ADI/master/ADI.sh
chmod +x ADI.sh
./ADI.sh
```


### Download Conf Files
```
rm -f ~/rAthena/conf/import-tmpl/*
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/atcommands.yml -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/battle_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/char_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/groups.yml -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/inter_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/inter_server.yml -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/log_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/login_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/map_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/packet_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/script_conf.txt -P ~/rAthena/conf/import-tmpl
wget -nc https://raw.githubusercontent.com/b1glord/ADI/master/import-tmpl/web_conf.txt -P ~/rAthena/conf/import-tmpl
```
