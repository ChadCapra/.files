# New machine setup

This is a guide for setting up a new arch linux machine (specifically, a chromebook/crostini setup)

##  Initialize lxc arch container

*https://wiki.archlinux.org/title/Chrome_OS_devices/Crostini*

**Delete all existing containers**

```
vmc destroy termina
vmc start termina
```

**Create arch container**

```
vmc container termina arch https://us.images.linuxcontainers.org archlinux/current
```

*The following error will be shown after completion:*
```
"Error: routine at frontends/vmc.rs:403 `container_setup_user(vm_name,user_id_hash,container_name,username)`
failed: timeout while waiting for signal"
```

```
vsh termina
lxc list
```

**Enter container to setup arch**

```
lxc exec arch -- bash
```

