New netdata multi server layout replace `<replace with your netdata server>` and `<replace with your netdata slave>` as needed

![Netdata Multi Server Dashboard](./netdatadash.png)

[Install custom dashboard](https://github.com/netdata/netdata/wiki/Custom-Dashboards)

* `/usr/share/netdata/web`

# Opt Out of Tracking

Run `sudo touch /etc/netdata/.opt-out-from-anonymous-statistics` to opt out of tracking.

https://github.com/netdata/netdata/blob/master/docs/anonymous-statistics.md#opt-out

# Setting up Master / Slave replication for Netdata

[Netdata Replication Documentation](https://github.com/netdata/netdata/tree/master/streaming)

Mainly on the first server you generate a uuid and set it in the stream.conf file, then on your other servers you put the uuid and ip address from the first server into their stream.conf files.

## Setup Slave
```
bash <(curl -Ss https://my-netdata.io/kickstart.sh)
#/etc/netdata/edit-config stream.conf
cp /usr/lib/netdata/conf.d/stream.conf /etc/netdata/
nano /etc/netdata/stream.conf
```

```
[stream]
  enabled = yes
  destination = <yourmasterserver.hostname>
  api key = <server defined api key>
```

`nano /etc/netdata/netdata.conf`

```
[global]
  memory mode = none
[web]
  mode = none
[backend]
  enabled = no
```

`sudo service netdata restart`

# /etc/netdata/netdata.conf tweaks

I like to set the history on the master server a little longer and disable logging since we'll use an nginx reverse proxy which will log access for us.

`history = 14400`
`access log = none`

# Securing it

To secure it, I only open the service port 19999 on the master/web server and limit it to the ip addresses of the slave servers. Then have nginx reverse proxy to localhost:19999 with http auth. Finally setup a jail in fail2ban for too many failed http auths
