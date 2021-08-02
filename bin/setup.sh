#!/bin/bash

NAME="Chad Capra"
EMAIL="chadcapra@gmail.com"

SSH_KEY_TYPE="ed25519" 
SSH_KEY_PARAMS="-o -a 256" 
SSH_KEY_PATH="$HOME/.ssh/id_$SSH_KEY_TYPE"

DOT_FILES_REPO="git@github.com:ChadCapra/.files.git"
DOTGIT_DIR=$HOME/.files
DOTGIT_BAK=$DOTGIT_DIR-"$(date +"%Y%m%d_%H%M%S")"


# Set current directory to home
cd $HOME

# Update system
sudo pacman -Syu --noconfirm

PKGS1="git base-devel fish starship tree tldr exa ncdu"
PKGS2="neovim fzf ripgrep docker nodejs npm elixir"

echo ""
echo "#########################################################################"
echo "### $PKGS1        ###"
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
echo "### setting up git and dotfiles                                       ###"
echo "#########################################################################"
echo ""

# Configure git and bare directory
git config --global user.name "$NAME"
git config --global user.email "$EMAIL"

# delete existing bare git dir and create new backup folder
# must include sub directories as mv will not (e.g. /bin)
rm -rf $DOTGIT_DIR
mkdir -p $DOTGIT_BAK/bin

# grab data from github and store in bare local dir: "~/$DOTGIT_DIR"
git clone --bare $DOT_FILES_REPO $DOTGIT_DIR
alias dotgit='/usr/bin/git --git-dir=$DOTGIT_DIR/ --work-tree=$HOME'

# checkout to home folder (to add/replace .vimrc, .zshrc, etc)
# and capture existing files and move to backup folder
dotgit checkout 2>&1 | egrep "^\s+" | awk {'print $1'} \
  | xargs -I{} mv {} $DOTGIT_BAK/{}
dotgit checkout

# Set up stream for pushing updates back to github
dotgit push --set-upstream origin main

# remove any empty backup folders
find $DOTGIT_BAK -empty -type d -delete


echo ""
echo "#########################################################################"
echo "### Changing default shell                                            ###"
echo "#########################################################################"
echo ""

# change default shell using sudo but for current user)
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
