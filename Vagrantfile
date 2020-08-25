# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box_check_update = false

  config.vm.define "service" do |service|
      service.vm.box = "generic/alpine38"
      service.vm.network "private_network", ip: "192.168.60.10"
      service.vm.synced_folder ".", "/vagrant"
      service.vm.provision "shell", inline: <<-SHELL
          apk --no-cache add docker python3-dev libffi-dev openssl-dev gcc libc-dev make
          rc-update add docker boot
          sed -i 's|DOCKER_OPTS=""|DOCKER_OPTS="-H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock"|' /etc/conf.d/docker
          service docker start
          pip3 --no-cache-dir install docker-compose
      SHELL
      service.vm.provider "virtualbox" do |vb|
          vb.customize ["modifyvm", :id, "--memory", "2048"]
          vb.customize ["modifyvm", :id, "--cpus", "1"]
          vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
      end
      service.trigger.before :halt do |trigger|
          trigger.name = "Stopping all docker containers before shutting down the VM..."
          trigger.run_remote = {inline: "docker-compose -f /vagrant/docker-compose.yml stop"}
      end
      service.trigger.after :up do |trigger|
          trigger.name = "Start docker containers"
          trigger.run_remote = {inline: "sysctl -w vm.max_map_count=262144; docker-compose -f /vagrant/docker-compose.yml up -d"}
      end
  end
end
