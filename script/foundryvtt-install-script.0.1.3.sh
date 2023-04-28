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
# - $1 = foundryvtt.zip Download URL
#
#
# See Changelog file for changes.

apt -qq update

apt install -y unzip
apt install -y libssl-dev


# Hier muss bei setup_x.x geschaut werden, ob eine neue Version vorhanden ist und ob die neue Version mit FoundryVTT funktioniert. Am besten in einer Testumgebung ausprobieren.
# Versionen können unter 'https://github.com/nodesource/distributions/tree/master/deb' nachgeschaut werden
echo -n "Zu verwendene Nodesource Version: "
read nodesourceversion
curl --silent --location https://rpm.nodesource.com/setup_$nodesourceversion.x | bash -
apt install -y nodejs
apt install -y npm

# PM2 installieren
npm install pm2@latest -g

# FoundryVTT Ordner vorbereiten
cd $HOME
mkdir foundryuserdata
cd foundryuserdata

echo -n "FoundryVTT Downloadlink angeben: "
read foundryvttdownloadlink

wget -0 foundryvtt.zip "$foundryvttdownloadlink"
unzip foundryvtt.zip

# FoundryVTT via PM2 starten
pm2 start ~/foundryvtt/resources/app/main.js

# PM2 Startup Script erstellen und speichern, damit Foundry bei einem Neustart wieder ausgeführt wird.
pm2 startup
pm2 save

echo "...Fertig! :)"

echo "Script ends in 15 seconds... "

sleep 15

# Script-ENDE
