Dynamic Linux MOTD
=========

Dynamically Generated MOTD for Linux Servers 

Compatibility: Debian based Distributions

![animated-screenshot](http://download.reidweb.com/dynmotdimg.gif)

## Installation

Clone the github repository
```bash
git clone https://github.com/ReidWeb/linuxmotd.git
```
Run the 'installation' script
```bash
cd linuxmotd
./install.sh
```
I'd recommend installing to /etc/dynmotd/, if you don't input anything it will default to /etc/dynmotd/. If you decided to use another directory, remember to change the directories below

### ASCII Art

In the input prompt, enter the directory to which you want to install the scripts - Defaults to /etc/dynmotd/

Now add some ASCII art by editing the file 'dynmotdart' in the installation directory, ASCII art can be generated at:
http://ruletheweb.co.uk/figlet/

### Update-Checker Script

Now add a cron job to auto-run the 'update-checker' script
```bash
sudo crontab -e
```
Append the following to the bottom of the file
```bash
0 * * * * /etc/dynmotd/update-checker.sh
```

### Setup MOTD to display on connect

Remove the contents of /etc/motd
```bash
sudo nano /etc/motd
```

#### Remove Default MOTD
Edit the /etc/ssh/sshd_config 
```bash
sudo nano /etc/ssh/sshd_config  
```
Replace 
```bash
PrintLastLog yes
#and
PrintMotd yes
```
with
```bash
PrintLastLog no
#and
PrintMotd no
```
Then restart the ssh service
```bash
/etc/init.d/ssh restart
```
Modify /etc/pam.d/login
```bash
sudo nano /etc/pam.d/login
```
Comment out the line below
```bash
#session    optional   pam_motd.so
```

#### Install new script

Modify /etc/profile
```bash
sudo nano /etc/profile
```
Append the following line to the bottom of the file:
```bash
/etc/dynmotd/dynmotd.sh
```
