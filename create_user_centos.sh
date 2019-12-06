#!/bin/bash
USER_COUNT=`cat /etc/passwd | grep '^xieydd:' -c`
USER_NAME='xieydd'
if [ $USER_COUNT -ne 1 ]
 then
 useradd $USER_NAME
 echo "123456" | passwd $USER_NAME --stdin
 else
 echo 'user exits'
fi

# visudo
 #sed -i '/root ALL=(ALL) ALL/a\xieydd ALL=(ALL) ALL' /etc/sudoers
