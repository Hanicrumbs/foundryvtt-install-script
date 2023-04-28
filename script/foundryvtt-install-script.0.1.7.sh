#!/bin/bash

# Version: 0.1.0
#
# Script zum installieren von  FoundryVTT als .Service via Node und PM2.
# Originalanleitung: 'https://foundryvtt.com/article/installation/'
#
# Installiert wird (in der angegebenen Reihenfolge):
# - unzip
# - libssl-dev
# - Nodesource
# - NodeJs
# - npm
# - PM2
#
# Mit PM2 wird der Node foundryvtt.service verwaltet und bei einem Systemneustart auch neu gestartet.
#
# Folgende Dateien werden heruntergeladen (Links müssen manuell hinzugefügt werden):
# - Foundryvtt.zip
#
# Arguments eingerichtet mit hilfe von 'https://linuxhandbook.com/bash-arguments/'
# Folgende Argumente werden im Script benutzt:
#
#
#
# See Changelog file for changes.

echo "Apt Update wird leise ausgeführt... "
sleep 3
apt -qq update

echo " "

echo "Unzip und libssl-dev werden installiert..."
sleep 3
apt install -y unzip
apt install -y libssl-dev

echo " "

# Hier muss bei setup_x.x geschaut werden, ob eine neue Version vorhanden ist und ob die neue Version mit FoundryVTT funktioniert. Am besten in einer Testumgebung ausprobieren.
# Versionen können unter 'https://github.com/nodesource/distributions/tree/master/deb' nachgeschaut werden

# Aktuellste Node und Nodesource Version: 20 (Stand: 2023-04-28)
echo -n "Zu verwendene Nodesource Version: "
read nodesourceversion
curl -fsSL https://deb.nodesource.com/setup_$nodesourceversion.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# PM2 installieren
echo " "
echo " "
echo "PM2 wird installiert... "
sleep 3
npm install pm2@latest -g

# npm aktualisieren
echo " "
echo " "
echo "npm wird aktualisiert... "
npm install -g npm@9.6.5

# FoundryVTT Ordner vorbereiten und FoundryVTT Installationsdatei herunterladen
echo " "
echo " "
echo "In den Home-Ordner bewegen... "
cd $HOME

echo " "
echo " "
echo "Neuen Ordner erstellen... "
mkdir foundryuserdata

echo " "
echo " "
echo "In den neuen Ordner bewegen... "
cd foundryuserdata

echo " "
echo " "
echo -n "FoundryVTT Downloadlink angeben: "
read foundryvttdownloadlink

wget -O foundryvtt.zip "$foundryvttdownloadlink"
unzip foundryvtt.zip

# FoundryVTT via Node starten
echo " "
echo " "
echo "Foundry mit Node starten.. "
sleep 3
node $HOME/foundryuserdata/resources/app/main.js --dataPath=$HOME/foundrydata

# PM2 Startup Script erstellen und speichern, damit Foundry bei einem Neustart wieder ausgeführt wird.
echo " "
echo " "
echo "PM2 Startup Script erstellen und speichern... "
sleep 3
pm2 startup
pm2 save

echo " "
echo " "
echo " "
echo " "
echo " "
echo "...Fertig! :)"
echo " "
echo "Script ends in 5 seconds... "

sleep 5

# Script-ENDE
