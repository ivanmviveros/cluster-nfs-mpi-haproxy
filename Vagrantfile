# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

NUMERO_NODOS=2

Vagrant.configure(2) do |config|  
  config.vm.box = "hashicorp/precise64"

  config.vm.define :master do |vm|
  	vm.vm.network :private_network, ip: "10.10.10.2", netmask: "255.255.255.0"
  	vm.vm.provider :virtualbox do |vb|
		  vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1, "--name", "master"]
  	end
    vm.vm.provision "shell", path: "openmpi.sh"
  	vm.vm.provision "shell", path: "nfs-servidor.sh"
    vm.vm.provision "shell", path: "haproxy-servidor.sh"
  end
  
  1.upto(NUMERO_NODOS) do |i|
    config.vm.define vm_name = "node#{i}" do |nodo|
      nodo.vm.network :private_network, ip: "10.10.10.#{2+i}", netmask: "255.255.255.0"
      nodo.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1, "--name", "node#{i}"]
      end
      nodo.vm.provision "shell", path: "openmpi.sh"
      nodo.vm.provision "shell", path: "nfs-cliente.sh"
      nodo.vm.provision "shell", path: "haproxy-cliente.sh", args: "HAClient#{i} 10.10.10.#{2+i}"
    end
  end
end
__END__
config.vm.define :node1 do |vm|
    vm.vm.network :private_network, ip: "10.10.10.3", netmask: "255.255.255.0"
    vm.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1, "--name", "node1"]
    end
    vm.vm.provision "shell", path: "openmpi.sh"
    vm.vm.provision "shell", path: "nfs-cliente.sh"
    vm.vm.provision "shell", path: "haproxy-cliente.sh", args: "HAClient1 10.10.10.3"
  end
  
  config.vm.define :node2 do |vm|
    vm.vm.network :private_network, ip: "10.10.10.4", netmask: "255.255.255.0"
    vm.vm.provider :virtualbox do |vb|
      vb.customize ["modifyvm", :id, "--memory", 512, "--cpus", 1, "--name", "node2"]
    end
    vm.vm.provision "shell", path: "openmpi.sh"
    vm.vm.provision "shell", path: "nfs-cliente.sh"
    vm.vm.provision "shell", path: "haproxy-cliente.sh", args: "HAClient2 10.10.10.4"
  end    