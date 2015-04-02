#!/bin/sh
add-apt-repository -y ppa:saltstack/salt
apt-get install -y salt-minion
echo "master: 10.0.1.3" >> /etc/salt/minion
service salt-minion restart
