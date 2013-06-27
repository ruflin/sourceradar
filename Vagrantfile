# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.

  config.vm.box = "debian7b4v3-rails"
  config.vm.host_name = "sourceradar"
  config.vm.box_url = "https://dl.dropbox.com/s/696ee7d5ictzuf9/debian7b4v3-rails.box?dl=1"

  #Using 2 CPUs. You can change it to 1
  config.vm.network :hostonly, "10.10.10.10", :adapter=>4
  config.vm.customize ["modifyvm", :id, "--memory", "1024", "--cpus", "2"]

  #Port forward to allow testing with Host IP
  config.vm.forward_port 3000, 3000

  #Fix Symlinks in Virtualbox Shared Folders
  config.vm.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant-root", "1"]

  #For extra speed, you can use NSF
  config.vm.share_folder "vagrant-root", "/vagrant", "."

  # Boot with a GUI so you can see the screen. (Default is headless)
  # config.vm.boot_mode = :gui

end
