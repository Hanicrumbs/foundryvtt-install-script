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
