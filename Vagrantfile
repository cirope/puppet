VAGRANTFILE_API_VERSION = '2'

Vagrant.configure VAGRANTFILE_API_VERSION do |config|
  config.vm.hostname = 'mawidabp.com'

  config.vm.box = 'chef/centos-7.0'
  config.vm.provision :shell, path: 'tools/install.sh'

  config.vm.network :forwarded_port, guest: 80, host: 8180

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Mawidabp CentOS 7'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
