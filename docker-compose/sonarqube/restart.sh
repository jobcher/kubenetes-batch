#!/bin/bash
sysctl -w vm.max_map_count=262144
sysctl -w fs.file-max=65536
ulimit -n 65536
ulimit -u 4096
# # 永久改变
# echo "vm.max_map_count=262144" >> /etc/sysctl.conf
# sysctl -p