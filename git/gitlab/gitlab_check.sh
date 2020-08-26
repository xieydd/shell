#!/bin/bash
return_code=`curl -s -w "%{http_code}" -o /dev/null http://10.10.10.98` # 注意 ip
 
if [[ $return_code -ne 200 ]]; then
systemctl stop keepalived
fi
