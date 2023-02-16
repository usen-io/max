# My Archlinux Version 
---
aka: MAX

> You need download the files both times, first when you are apply Base Setup and with back after restart the VM.
> `curl -L -o main.zip https://github.com/usen-io/max/archive/refs/heads/main.zip && bsdtar xvf main.zip && cd max-main`


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
