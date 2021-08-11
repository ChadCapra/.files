#!/bin/bash

NAME="Chad Capra"
EMAIL="chadcapra@gmail.com"

DOTFILES_REPO="git@github.com:ChadCapra/dotfiles.git"
DOTFILES_DIR=$HOME/dotfiles

SSH_KEY_TYPE="ed25519" 
SSH_KEY_PARAMS="-o -a 256" 
SSH_KEY_PATH="$HOME/.ssh/id_$SSH_KEY_TYPE"

PKGS1="git base-devel fish starship tree tldr unzip"
PKGS2="neovim fzf ripgrep docker nodejs npm elixir"
YPKGS="z.lua docker-compose"

# Set current directory to home
cd $HOME

# Update system
sudo pacman -Syu --noconfirm

echo ""
echo "#########################################################################"
echo "### Installing $PKGS1            ###"
echo "### Installing $PKGS2            ###"
echo "#########################################################################"
echo ""

sudo pacman -S --noconfirm $PKGS1 $PKGS2


# Install yay (if missing)

if pacman -Qs yay > /dev/null ; then
  echo "yay is already installed"
else
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
  cd ..
  rm -rf yay
fi

echo ""
echo "#########################################################################"
echo "### yay is installed... updating system using yay                     ###"
echo "#########################################################################"
echo ""

yay

echo ""
echo "#########################################################################"
echo "### Installing (via yay) $YPKGS            ###"
echo "#########################################################################"
echo ""

yay -S $YPKGS

# Create ssh key (if non-exists)...
echo ""
echo ""
echo "#########################################################################"
echo "###  Creating ssh key at $SSH_KEY_PATH"
echo "###    - Add password to better protect ssh key"
echo "#########################################################################"
echo ""
echo ""

ssh-keygen $SSH_KEY_PARAMS -t $SSH_KEY_TYPE -C "$EMAIL" -f $SSH_KEY_PATH

echo ""
echo ""
echo "#########################################################################"
echo "#####   $SSH_KEY_PATH.pub key below"
echo "#########################################################################"
echo ""

# show public ssh-key to add to github
CONTENTS=sudo cat $SSH_KEY_PATH.pub
echo "$CONTENTS" 

# TODO: Automatically copy key into clipboard
# (once issue with char limit is figured out)
#printf "\033]52;c;$(echo "$CONTENTS" | base64)\a"

# pause to give user a chance to add key to github
echo ""
echo ""
echo "#########################################################################"
echo "###  Before continuing, copy above ssh-key into github to allow access"
echo "#########################################################################"
echo ""
read continue


echo ""
echo "#########################################################################"
echo "### Set up git and dotfiles                                       ###"
echo "#########################################################################"
echo ""

# Configure git and bare directory
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"

# delete existing dotfiles and clone
rm -rf $DOTFILES_DIR
git clone $DOTFILES_REPO $DOTFILES_DIR

# Run auto symlink setup
source $DOTFILES_DIR/linkdots.sh


echo ""
echo "#########################################################################"
echo "### Changing default shell                                            ###"
echo "#########################################################################"
echo ""

# change default shell using sudo but for current user)
echo $(which fish) | sudo tee -a /etc/shells
sudo chsh -s $(which fish) $USER

echo ""
echo ""
echo "#########################################################################"
echo "### Your machine is all set up! Let's restart the shell to launch fish ##"
echo "###        * Press Enter to continue when ready...                    ###"
echo "#########################################################################"
echo ""
read continue

# final step is to reset terminal
reset; exec sudo --login --user $USER
