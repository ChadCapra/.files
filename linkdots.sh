#!/bin/bash

DOTFILEDIR="$HOME/dotfiles/home"
BACKUPDIR=$HOME/dotfiles.bak/"$(date +"%Y%m%d_%H%M%S")"

mkdir -p $BACKUPDIR

backup_existing() {
  existing_path=$HOME/$1
  backup_path=$BACKUPDIR/$1

  if [[ -e "$existing_path" ]]; then
    mkdir -p "${backup_path%/*}"
    mv $existing_path $backup_path
  fi
}

symlink_dotfile() {
  git_path=$DOTFILEDIR/$1
  link_path=$HOME/$1

  mkdir -p "${link_path%/*}"
  ln -s $git_path $link_path
}

# iterate through each dotfile and symlink from relative location
cd $DOTFILEDIR

find . -type f -print0 | while read -d $'\0' file; do
  relfile=$(echo $file | cut -c 3-)
  echo "linking ... $relfile"
  backup_existing $relfile
  symlink_dotfile $relfile
done

# remove any empty backup folders
find $BACKUPDIR -empty -type d -delete

echo "All set! Any existing files were moved to $BACKUPDIR"

