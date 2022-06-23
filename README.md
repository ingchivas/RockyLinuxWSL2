# Rocky Linux 8.5 WSL

---

Rocky Linux on WSL based on [wsldl by yuk7](https://github.com/yuk7/wsldl)

## Requirements

- Windows 11/10 64bit with WSL2 enabled.

- For Win 10 x64 systems: **Version 1903** or higher, with **Build 18362** or higher.

- Docker (If you want to get the rootfs by yourself)

## Enable WSL

To enable WSL on a supported system run Powershell with admin privileges and run the next command:

```batch
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
```

Also enable The VM Platform:

```batch
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
```

Set WSL 2 as your default version

```batch
wsl --set-default-version 2
```

It's suggested that you update the Linux kernel by running:

```batch
wsl --update
```

Or search for the update on this [link](https://www.catalog.update.microsoft.com/Search.aspx?q=WSL) and install it manually.

## Installing Rocky Linux 8.5 in WSL2

Just run the "RockyLinux-8.5.exe" file, keep in mind the filename of the EXE will be used as the distro name under WSL.

When the install process finishes, you can run the ``setupv2.sh`` file on the Rocky Linux WSL terminal to configure the users and add frequently used tools.

If you want, you can also configure it by running the following commands:

```bash
yum -y update
yum install glibc-langpack-en -y
yum install passwd sudo cracklib-dicts -y

# These packages are opitonal
# yum install ncurses -y
# yum install net-tools yum-utils -y

adduser -G wheel <username>
echo -e "[user]\ndefault=<username>" >> /etc/wsl.conf
passwd <username>
```

To finish, just exit and restart wsl.

```batch
wsl --shutdown
wsl -d <YourDistroName>
```

You should have a functioning Rocky Linux WSL install.

![](https://i.imgur.com/Gg4OqrF.png)

## To get the rootfs.tar by docker

Just ensure docker is installed and run ``getRockyLinux.sh`` 
