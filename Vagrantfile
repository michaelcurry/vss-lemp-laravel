Vagrant.configure("2") do |config|
  ## Choose your base box
  config.vm.box = "precise64"

  ## For masterless, mount your file roots file root
  config.vm.synced_folder "salt/roots/", "/srv/"

  # Forward Agent
  #
  # Enable agent forwarding on vagrant ssh commands. This allows you to use identities
  # established on the host machine inside the guest. See the manual for ssh-add
  config.ssh.forward_agent = true

  # Network
  config.vm.network :private_network, :ip => "10.0.0.60"
  config.vm.hostname = "test"

  # Set the ownership of the app/storage directory
  config.vm.synced_folder "app/storage", "/vagrant/app/storage", :owner => 'www-data', :group => 'www-data'

  ## Set your salt configs here
  config.vm.provision :salt do |salt|

    ## Minion config is set to ``file_client: local`` for masterless
    salt.minion_config = "salt/minion"

    ## Installs our example formula in "salt/roots/salt"
    salt.run_highstate = true

    ## verbose
    salt.verbose = true

    ## bootstrap
    salt.bootstrap_script = "salt/bootstrap.sh"
    salt.bootstrap_options = "-D"

  end

end