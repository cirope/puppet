VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.hostname = 'quieroruby.com.ar'

  config.vm.box = 'ubuntu/trusty64'
  config.vm.provision :shell, path: 'tools/install.sh'

  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Quieroruby trusty64'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
