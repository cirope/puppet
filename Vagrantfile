VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.host_name = 'cirope.com'

  config.vm.box = 'arch64'
  config.vm.box_url = 'https://downloads.sourceforge.net/project/vagrant-archlinux/vagrant-archlinux.box'
  config.vm.provision :shell, path: 'tools/install.sh'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Cirope Arch 64'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
