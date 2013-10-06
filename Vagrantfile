#!/usr/bin/ruby

#
# Vagrant File for Docker - Requires Vagrant 1.1+
# Provisioner: Salt
# OS: Ubuntu 12.04 LTS 64Bit
#

Vagrant.configure("2") do |config|

    # Base Box - http://www.vagrantbox.es/ - Ubuntu 12.04 LTS 64bit
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.ssh.forward_agent = true

    # Port Forwarding
    config.vm.network :forwarded_port, guest: 4243, host: 4243
    (49000..49900).each do |port|
      config.vm.network :forwarded_port, :host => port, :guest => port
    end

    # Virutalbox Settings
    config.vm.provider :virtualbox do |v|
        # Enables symlinks
        v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root", "1"]
    end

    #
    # Mounts
    #

    # Salt State Formulas
    config.vm.synced_folder "./provisioner", "/srv/salt"

    #
    # Provisioner - Salt
    #

    config.vm.provision :salt do |salt|
        salt.run_highstate = false
        salt.minion_config = "provisioner/config/minion.conf"
        salt.install_type = "stable"
    end

end
