sudo mv /etc/pacman.d/gnupg /root/pacman-key.bak
sudo pacman-key --init
sudo pacman-key --populate archlinux endeavouros
sudo pacman -Syy archlinux-keyring endeavouros-keyring
sudo pacman -Syyu

