# Setup Arch on Chromebook

This is a guide for setting up a new arch linux machine (specifically, a chromebook/crostini setup).  If you run into any issues, please refer to the following guide:

*https://wiki.archlinux.org/title/Chrome_OS_devices/Crostini*


##  Create lxc arch container

**Setup VM and base lxc arch container**

Delete current VM (and recreate)
```
vmc destroy termina
vmc start termina
```

*exit VM shell (back to crosh)*
```
exit
```

Create arch container (by using image from linuxcontainers.org)
```
vmc container termina arch https://us.lxd.images.canonical.com/ archlinux/current
```
*The following error will be shown after completion:*
```
ERROR vsh: [vsh.cc(171)] Failed to launch vshd for termina:arch: requested container does not exist: arch
```

**Confirm lxc "arch" container is running**

Connect into termina (and list containers)
```
vsh termina
```
```
lxc list
```

##  Setup/Configure lxc arch container

From inisde vsh (inside termina)
```
lxc exec arch -- bash
```

**Update system**
```
pacman -Syu --noconfirm
```

Install base-devel (which includes "sudo" and "makepkg")
```
pacman -S --noconfirm base-devel
```

**Allow sudo for all users**

```
visudo
```
... by allowing "wheel" group to run all cmds (via sudo)
```
## Uncomment to allow members of group wheel to execute any command
%wheel ALL=(ALL) ALL
```
let's figure out your current *username*
```
grep 1000:1000 /etc/passwd|cut -d':' -f1
```
*all subsequent references to *username* refer to username returned from above*

... then add user to the wheel group
```
usermod -aG wheel *username*
```

**Change password**

And next, change password for *user* (so in future, we login as user and not root)
```
passwd *username*
```

**Set up locale**

Arch's default language is C (from the image chosen above), so let's fix that
*using guidance from https://wiki.archlinux.org/title/locale*

First,confirm what language is set
```
locale -a
```

Return might look like:
```
locale: Cannot set LC_CTYPE to default locale: No such file or directory
locale: Cannot set LC_MESSAGES to default locale: No such file or directory
locale: Cannot set LC_COLLATE to default locale: No such file or directory
C
POSIX
```
*Ignore any warnings or labels, they will be fixed shortly*

If the language you desire is not listed (e.g. en_US.UTF-8), then edit `/etc/locale.gen`
```
vi /etc/locale.gen
```
and uncomment the following the line
```
...
#en_SG ISO-8859-1
en_US.UTF-8 UTF-8
#en_US ISO-8859-1
...
```

Save the file `:wq` and generate locale
```
locale-gen
```
Now, run the following
```
localectl set-locale LANG=en_US.UTF-8
```
*this writes `LANG=en_US.UTF-8` env variable to `/etc/locale.conf`*

Let's apply the language right away (it should also work to shut down VM and start it again)
```
unset LANG
```
```
source /etc/profile.d/locale.sh
```

Verify locale/language
```
locale
```
which should return
```
LANG=en_US.UTF-8
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=
```

**Run container as user / verify network**

Now, let's exit, and log back in using the newly configured user (who now has sudo access)
```
exit
lxc console arch
```
*You must hit enter to get a prompt to login (use username and password chosen above)*

Verify networking is all set and you now have a working arch machine!!
```
ip -4 a show dev eth0
```
*if you don't see IP address(es), then something went wrong, refer to guide at beginning*

**Set up git and yay**
Set up git (needed for downloading Crostini container tools)
```
sudo pacman -Sy git --noconfirm
```

Install yay (to allow for quick installs of AUR packages)
```
git clone https://aur.archlinux.org/yay.git
```

Change into yay directory, make (i.e. build), get deps (-s) and install (-i)
```
cd yay
makepkg -si
```

Delete yay source code/build items)
```
cd ..
rm -rf yay
```

Run yay to confirm it is working (same as yay -Syu, which does system/pacman pkgs + AUR packages!)
```
yay
```

## Next setup Crostini support (i.e. app launcher/displays)

Assuming, you installed `yay` (from above steps) we can use that for setting up Crostini Tools

```
yay cros-container-guest-tools-git
```
*If asked which packages to install, enter 1*

*When asked 1) gvim or 2) vim, enter 2 (we prefer terminal :))*

*No need to view differences (when asked, enter N)*

*As you probably figured out by now, enter Y (for each time you are asked to proceed with install)*

Install Wayland and XOrg-Wayland (using pacman, but yay could probably be used too)
```
sudo pacman -S --noconfirm wayland
```
```
sudo pacman -S --noconfirm xorg-xwayland 
```

Now, we need to start/enable the following services
```
systemctl --user enable --now sommelier@0 sommelier-x@0 sommelier@1 sommelier-x@1
```
*You should see a bunch of symlinks created (4 to be exact)*

We can verify at least 1 service
```
systemctl --user status sommelier@1
```

You should see output similiar to the following:
```
* sommelier@1.service - Parent sommelier listening on socket wayland-1
     Loaded: loaded (/usr/lib/systemd/user/sommelier@.service; enabled; vendor preset: enabled)
    Drop-In: /usr/lib/systemd/user/sommelier@1.service.d
             `-cros-sommelier-low-density-override.conf
             /usr/lib/systemd/user/sommelier@.service.d
             `-cros-sommelier-override.conf
     Active: active (running) since Tue 2021-08-03 15:45:50 UTC; 6s ago
```


Then exit (hit `q` to stop viewing output), and detach
```
exit
[Ctrl+a q]
```


## Rename Container and Restart

The lxc container that you wish to integrate with Crostini (i.e. ChromeOS) must be named "penguin"

Stop Container, and confirm it's stopped
```
lxc stop arch
lxc list
```
*You can use lxc stop --force arch, but it should stop without issue, assuming you exited*

Rename container, start it (and confirm)
```
lxc rename arch penguin
lxc start penguin
lxc list
```

Exit vsh (therefore, exiting the VM)
```
exit
```

Stop VM (and confirm)
```
vmc stop termina
vmc list
```

At this point, we could probably just start the termina VM `vmc start termina` but I like to know it is all going to work when I power down and start up again, so..
```
1. POWER OFF CHROMEBOOK
2. POWER ON CHROMEBOOK
3. CLICK ON TERMINAL (in launcher)
```

After launching terminal, you should see "start VM", "starting container", etc...
Once started...
```
yay
```
*This updates everything for your linux subsystem*

```
exit
```


## Create Backup for Linux VM + lxc containers (so you don't need to do these steps again :))

`ChromeOS -> Settings -> Developers -> Linux -> Backup & Restore -> Backup`

Helpful hint: Name backup based on what is inside (e.g. arch-base)
*Sample Name: arch-base-2021-07-31.tini*

If you add a bunch of stuff you can later do another backup based again on what it is used for:
*arch-development-2021-08-01.tini*


# Install Desired Software

Now, that you have a fully functional arch system running on your chromebook (or if you have arch setup on a different machine), you can use the following script to complete your setup with the necessary tools.

```
sh <(curl -L https://raw.githubusercontent.com/ChadCapra/dotfiles/main/setup.sh)
```

The script above will install the base software needed for elixir development (e.g. base-devel, yay, git, neovim, elixir, etc)
*Many of the items have been installed already, but this allows us to re-use the same script on a brand new arch box (non-crostini)

**Additional Steps after setup.sh**

After running `setup.sh` which calls `linkdots.sh`, all your dotfiles will be linked to the correct paths.  However, please note, that if you add/rename/delete a dotfile, you will need to run `./linkdots.sh` script again so that dotfiles managed via git are linked correctly again.

Also, after starting `nvim` for the first time, you will likely encounter an error and that is because, although packer was installed via init.lua, the rest of your packages (via packer) are not installed.

To complete neovim setup:
```
nvim .
:PackerCompile
:PackerInstall
```

You can then in the future run
```
:PackerSync
```
*This will clean up unused packages, and install new ones*

```
:q
```

Lastly, you will need to install language servers for languages desired (e.g. lua, typescript, elixir)
```
nvim .
:LspInstall lua
:LspInstall typescript
:LspInstall elixir
```

Quit and restart nvim
```
:q
nvim .
```

If using wayland (and gnome), we need to install pipewire and xdg-desktop-portal (choose gnome/gtp extra from prompt)
```
yay -S pipewire
yay -S xdg-desktop-portal
```
