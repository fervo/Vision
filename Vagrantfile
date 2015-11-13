# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Create and configure the VM(s)
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Assign a friendly name to this host VM
  config.vm.hostname = "docker-host"

  # Skip checking for an updated Vagrant box
  config.vm.box_check_update = false

  # Always use Vagrant's default insecure key
  config.ssh.insert_key = false
#  config.vm.network "forwarded_port",
#    guest: 2375, host: 2375, id: "docker", disabled: false
  config.vm.network "private_network", :ip => "192.168.42.43"

  # Spin up a "host box" for use with the Docker provider
  # and then provision it with Docker
  config.vm.box = "slowe/ubuntu-trusty-x64"
  config.vm.provision "shell", path: "provision.sh"
  config.vm.provision "docker"
  config.vm.provision "shell", path: "docker-1.8.sh"

  # Disable synced folders (prevents an NFS error on "vagrant up")
  config.vm.synced_folder ".", "/vagrant", disabled: true
  ["vmware_fusion", "vmware_workstation"].each do |vmware|
    config.vm.provider vmware do |v, override|
      v.vmx["memsize"] = 4096
      v.vmx["numvcpus"] = 2
    end
  end
end
