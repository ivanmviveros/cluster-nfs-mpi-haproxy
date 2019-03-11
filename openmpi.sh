echo "10.10.10.2 master" >> /etc/hosts
echo "10.10.10.3 node1" >> /etc/hosts
echo "10.10.10.4 node2" >> /etc/hosts
# we only generate the key on one of the nodes
if [[ ! -e /vagrant/id_rsa ]]; then
  ssh-keygen -t rsa -f /vagrant/id_rsa -N ""
fi
install -m 600 -o vagrant -g vagrant /vagrant/id_rsa /home/vagrant/.ssh/
# the extra 'echo' is needed because Vagrant inserts its own key without a
# newline at the end
(echo; cat /vagrant/id_rsa.pub) >> /home/vagrant/.ssh/authorized_keys
sudo apt-get update
sudo apt-get install -y openmpi-bin openmpi-doc libopenmpi-dev
touch /etc/.provisioned
