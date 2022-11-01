# My Archlinux Version 
---
aka: MAX

```
# to get the <DISK> execute `lsblk`
./0_BaseSetup_ARM <DISK>

# base setup system
./1_BaseSetup_SYS <HOSTNAME>

# base setup user
./2_BaseSetup_USR <USERNAME>

# base setup graphical interface
su -c './3_BaseSetup_GPH <USERNAME>' <USERNAME>

# base setup terminal interface
su -c './4_BaseSetup_TER <USERNAME>' <USERNAME>
```
