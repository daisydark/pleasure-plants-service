Vagrant.configure("2") do |config|

    config.vm.provision "shell", path: ".vagrant/provision/global.sh"
    config.vm.post_up_message = "VM-Machine URLs: web.pleasure-plants.local, sql.pleasure-plants.local <web|sql>"
    config.ssh.insert_key = false

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = false
    config.hostmanager.manage_guest = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

    config.vm.define "web" do |web|
      web.vm.box = "ubuntu/bionic64"
      web.vm.provision :shell, path: ".vagrant/provision/web.sh"
      web.vm.hostname = "web.pleasure-plants.local"
      web.vm.network "private_network", ip: "192.168.60.22"
      web.hostmanager.aliases =%w(sql.pleasure-plants.local)
    end

    config.vm.define "sql" do |sql|
      sql.vm.box = "ubuntu/bionic64"
      sql.vm.provision :shell, path: ".vagrant/provision/sql.sh"
      sql.vm.hostname = "sql.pleasure-plants.local"
      sql.vm.network "private_network", ip: "192.168.60.23"
    end
end
