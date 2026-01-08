#!/bin/sh
# Autor: Francisco Javier Gutierrez | Unix/Linux Architect & Cloud Engineer

# Drenar nodos
for i in $(cat nodes); do kubectl drain $i --ignore-daemonsets --delete-emptydir-data; done

# Detener servicios en los nodos:
for i in $(cat nodes); do ssh root@$i 'systemctl stop kubelet && systemctl stop containerd'; done

