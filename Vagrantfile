VAGRANTFILE_API_VERSION = '2'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.host_name = 'cirope.com'

  config.vm.box = 'arch64'
  config.vm.box_url = 'https://dl.dropboxusercontent.com/u/6750592/Arch_Linux_2013.11_x64.box'
  config.vm.provision :shell, path: 'tools/install.sh'

  config.vm.network :forwarded_port, guest: 8080, host: 8080

  config.vm.provider 'virtualbox' do |vb|
    vb.name = 'Cirope arch64'
    vb.customize ['modifyvm', :id, '--memory', '1024']
  end
end
