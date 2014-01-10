VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.host_name = 'cirope.com'

  config.vm.box = 'precise'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'
  config.vm.provision :shell, path: 'tools/install.sh'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Cirope precise'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
