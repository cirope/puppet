pacman -S --needed --noconfirm base-devel wget

wget https://aur.archlinux.org/packages/pu/puppet/puppet.tar.gz

tar -xzf puppet.tar.gz
cd puppet
makepkg --asroot
pacman -U --noconfirm puppet*.tar.xz

cd ..
rm puppet.tar.gz
rm -rf puppet/
