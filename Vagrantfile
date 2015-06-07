VAGRANTFILE_API_VERSION = '2'

Vagrant.configure VAGRANTFILE_API_VERSION do |config|
  config.vm.hostname = 'autocdh.com'

  config.vm.box = 'debian/jessie64'
  config.vm.provision :shell, path: 'tools/install.sh'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Autocdh Debian 8'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
