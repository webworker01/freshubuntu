# ./freshubuntu
## Handy things for setting up a new Ubuntu server

This is a set of scripts to help secure and enhance your experience on Ubuntu Server.

The main script will cover:
* Timezone and Locale
* Update of packages
* Optional extra useful tools install
    * [fail2ban](https://www.fail2ban.org) - intrusion protection for SSH (and possibly other services with configuration)
    * [ufw](https://wiki.ubuntu.com/UncomplicatedFirewall) - simple command line firewall
    * [curl](https://curl.haxx.se/) - command line URL client
    * [bash-completion](https://github.com/scop/bash-completion) - command line auto completion (TAB to cycle)
    * [htop](https://hisham.hm/htop/) - TUI process/task manager
    * [jq](https://stedolan.github.io/jq/) - parse and query JSON data
    * [bc](https://www.gnu.org/software/bc/) - cli calculator
* Hostname / IPV6 / UFW configuration
* SSH security
    * Setup non-root superuser with SSH key based login
    * Disable remote root login and password (text) logins

## Setup
On a fresh install of Ubuntu 16 or 18 follow these steps to get started and the script will guide you through the rest.
```
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git
cd ~
git clone https://github.com/webworker01/freshubuntu.git
cd freshubuntu
sudo ./freshubuntu
```

## All contents / Other optional tools
Most scripts have documentation within them so please read through them, learn and suggest improvements!

Script Name | Function
----------- | --------
**freshubuntu** | Run this first as root for initial setup of your server for basic security needs
**.screenrc** | Make the screen program fancier - Copy to your home directory
**01-serverid** | Add to /etc/update-motd.d to display some info about your server on login
**fail2banstatusall** | Script to show status of all fail2ban jails
**backup** | Encrypted incremental backups using duplicity, some config required, see script comments. Add to daily cron and set it and forget it
**letsencryptcertbot** | Setup free SSL/TLS certificates for websites
**[netdata](./netdata)** | Lightweight dashboard for monitoring server resources see [readme](./netdata)
