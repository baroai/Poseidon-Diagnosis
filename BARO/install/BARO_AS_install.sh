#! bin/bash

sudo DEBIAN_FRONTEND=noninteractive apt-get install sysstat mailutils postfix -y
sudo postconf -e message_size_limit=0
sudo service postfix restart
ln -s /home/oem/BARO/AStool/Barocheck.sh /usr/bin
echo -e "[Desktop Entry]\nName=Poseidon Diagnosis\nComment=Poseidon Diagnosis\nExec=Barocheck.sh\nIcon=/home/oem/BARO/ASicon/BAROAS-64.png\nTerminal=true\nType=Application\nCategories=Development;AS;BARO;" > /usr/share/applications/BARO-AS.desktop
chmod 777 /usr/share/applications/BARO-AS.desktop
chmod +x /usr/share/applications/BARO-AS.desktop


