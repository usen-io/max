# My Archlinux Version 
---
aka: MAX


## Step 0: preparation

### preparation: get the ISO

+ ARM version need to be donwloaded from: https://pkgbuild.com/~tpowa/archboot/web/archboot.html
Thanks Tobias Powalowski - tpowa: https://archlinux.org/people/developers/#tpowa

+ X64 version need to be donwloaded from: https://archlinux.org/download/

### preparation: create a VM or place your metal on the table ;)

+  In both case (ARM/X64) the machine need to be:
    + connected to internet
    + within the iso file placed as a first boot device
    + at least with 9GB of disk storage, 1G of RAM and 1 vCPU
    + for an easy copy/pate code with a bridged interfce for ssh login from other machine in the same network.

### preparation: get the installation scripts

+  Turn on your machine and place the files to start the installation.
+  Affter start the machine use:
    + `passwd`  command for creatate a root password that let you sign-in via ssh.
    + `ip -o a` command for retrieve the ip that your need to connect via ssh.
    + `ssh root@IP-OF-THE-MACHINE` command to get into the target machine. 

> You need download the files both times, first when you are apply Base Setup and with back after restart the VM.
> > `curl -L -o main.zip https://github.com/usen-io/max/archive/refs/heads/main.zip && bsdtar xvf main.zip && cd max-main`

## Step 1: running the scripts


```
# to get the <DISK> execute `lsblk`
./0_BaseSetup_ARM <DISK>
./0_BaseSetup_X64 <DISK>

# base setup system
./1_BaseSetup_SYS <HOSTNAME>

# base setup user
./2_BaseSetup_USR <USERNAME>

# base setup graphical interface
su -c './3_BaseSetup_GPH <USERNAME>' <USERNAME>

# base setup terminal interface
su -c './4_BaseSetup_TER <USERNAME>' <USERNAME>
```
