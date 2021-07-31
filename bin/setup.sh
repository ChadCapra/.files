#!/bin/bash

# Set current directory to home
cd $HOME

# Update system
sudo pacman -Syu --noconfirm

PKGS="git base-devel fish neovim docker elixir"

echo ""
echo "#########################################################################"
echo "### Installing $PKGS               ###"
echo "#########################################################################"
echo ""

sudo pacman -S --noconfirm $PKGS


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


# Create ssh key (if non-exists), using following parameters...
NAME="Chad Capra"
EMAIL="chadcapra@gmail.com"
SSH_KEY_TYPE="ed25519" 
SSH_KEY_PARAMS="-o -a 256" 
SSH_KEY_PATH="$HOME/.ssh/id_$SSH_KEY_TYPE"

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



