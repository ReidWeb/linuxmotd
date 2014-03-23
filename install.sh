#!/bin/bash
# DynMotd Install Script
#!/bin/bash
#!/bin/bash

echo -ne "\033[0;32mSelect installation directory > \033[1;37m"
read installdir
if  [[ $installdir = "" ]]
then
installdir = "/etc/dynmotd"
fi

mkdir $installdir
cp dynmotd.sh $installdir/dynmotd.sh
chmod 755 $installdir/dynmotd.sh
touch $installdir/dynmotdart
chmod 755 $installdir/dynmotdart
echo "MOTD ART MISSING: Please place some ASCII MOTD art in /etc/dynmotd/dynmotdart" >> $installdir/dynmotdart
cp update-checker.sh $installdir/update-checker.sh
chmod 755 $installdir/update-checker.sh
touch $installdir/updates-available
chmod 755 $installdir/updates-available
echo "--" >> $installdir/updates-available
echo -e "\033[0;33mScript setup complete, please refer to https://github.com/ReidWeb/linuxmotd/blob/master/README.md for instructions on how to complete the installation process \033[1;37m"
