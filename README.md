# New machine setup

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
vmc container termina arch https://us.images.linuxcontainers.org archlinux/current
```
*The following error will be shown after completion:*
```
Error: operation `container_start` failed: timeout while waiting for signal
[ERROR:src/main.rs:181] ERROR: command failed
```

**Confirm lxc container (called "arch") is running**

Connect into termina (and list containers)
```
vsh termina
lxc list
```

##  Setup/Configure lxc arch container

From inisde vsh (inside termina)
```
lxc exec arch -- bash
```

**Update system**
```
pacman -Syu
```

Install base-devel (which includes "sudo" and "makepkg")
```
pacman -S base-devel
```

**Allow sudo for all users**
```
visudo
```
... by allowing "wheel" group to run all cmds (via sudo)
```
# %wheel ALL=(ALL) ALL
```
... then add user to the wheel group
```
usermod -aG wheel *username*
```

**Change password**
*If you don't know username*
```
grep 1000:1000 /etc/passwd|cut -d':' -f1
```

Change password for *user* (so in future, we login as user and not root)
```
passwd *username*
```

Now, let's exit
```
exit
```

**Set up git, yay and verify everything is working!**

But this time, let's use the user we just configured to have access to everything!
```
lxc console arch
```
*You must hit enter to get a prompt to login (use username and password chosen above)*

Verify networking is all set:
```
ip -4 a show dev eth0
```
*if you don't see IP address(es), then something went wrong, refer to guide at beginning*

Setup git (needed for downloading Crostini container tools)
```
sudo pacman -S git
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

## Next setup for Crostini support (app launcher/displays)

Assuming, you installed `yay` we can use that for setting up Crostini Tools

```
yay cros-container-guest-tools-git
1
1
N
```
*If asked which packages to install, enter 1*
*When asked 1) gvim or 2) vim, enter 1*
*No need to view differences (when asked)*
*Lastly, this will also install dependencies to simplify your life!*

Install Wayland and XOrg-Wayland (using pacman, but yay could probably be used too)
```
sudo pacman -S wayland
sudo pacman -S xorg-xwayland 
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

Then exit, and detach
```
exit
[Ctrl+a q]
```


## Rename Container and Restart (everything)

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
*Sample Name: chromeos-arch-base-2021-07-28.tini*

If you add a bunch of stuff you can later do another backup based again on what it is used for:
*chromeos-arch-development-2021-07-28.tini*



