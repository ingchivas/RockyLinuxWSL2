#! /bin/bash
yum -y update
yum install glibc-langpack-en -y
yum install passwd sudo cracklib-dicts -y
yum install ncurses -y
yum install net-tools yum-utils -y

# Setting up user

echo "Insert new Username for RockyLinux 8.5:"
read newUsername
adduser -G wheel $newUsername
echo -e "[user]\ndefault=$newUsername" >> /etc/wsl.conf
echo "Setting up password for $newUsername"
passwd $newUsername

exit
