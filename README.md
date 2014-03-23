Dynamic Linux MOTD
=========

Dynamically Generated MOTD for Linux Servers (Currently Debian based only)

## Installation

Clone the github repository
```bash
git clone git@github.com:ReidWeb/linuxmotd.git
```
Run the 'installation' script
```bash
cd linuxmotd
./install.sh
```

### ASCII Art

In the input prompt, enter the directory to which you want to install tbe scripts - Defaults to /etc/dynmotd/

Now add some ASCII art by editing the file 'dynmotdart' in the installation directory, ASCII art can be generated at:
http://ruletheweb.co.uk/figlet/

### Update-Checker Script

Now add a cron job to auto-run the 'update-checker' script
```bash
sudo crontab -e
```
Append the following to the bottom of the file
```bash
0 * * * * /etc/dynmotd/update-checker
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
/usr/local/bin/dynmotd
```
