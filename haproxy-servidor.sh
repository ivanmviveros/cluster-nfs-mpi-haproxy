#!/bin/bash
sudo apt-get install -y haproxy
sudo sed -i 's/ENABLED=0/ENABLED=1/g' /etc/default/haproxy
sudo rm /etc/haproxy/haproxy.cfg
sudo cp -f /vagrant/haproxy.cfg /etc/haproxy/
sudo service haproxy start
