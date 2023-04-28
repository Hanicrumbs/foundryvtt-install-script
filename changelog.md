# Changelog

## 0.1.x

### 0.1.0

- Initial creation of script

### 0.1.1

- Removed 'sudo' from commands

### 0.1.2

- Fixed 'apt install update' > 'apt update'
- Removed 'apt upgrade -y'

### 0.1.3

- Added '-qq' option to 'apt update' command
- Added 'apt install -y npm' to install npm
- Added 'echo' at the end of the script, announcing that the script will end in X seconds

### 0.1.4

- Fixed 'wget' command for downloading the foundryvtt.zip file
- Added several 'echo' commands, announcing what is going to happen

### 0.1.5

- Fixed 'pm2 start ...' command's path-to-file
- Changed installation for nodejs and npm to silent installation 'apt install -qq -y '

### 0.1.6

- Changed readme section at the top of the file
- Fixed install command for nodesources and nodejs
- Added 'npm install npm@9.6.5' update command (needs to be updatet once a new version is released)
- Removed 'apt install node' and 'apt install npm' command

### 0.1.7

- Fixed starting the NodeJs Server. Changed starting it from pm2 to node
- Added needed variables to the node launch command

### 0.1.8

- Changed the nodejs startup command to detach from the script
- Added 'sleep 10' command after nodejs startup command
- Added 'pm2 start ...' command

