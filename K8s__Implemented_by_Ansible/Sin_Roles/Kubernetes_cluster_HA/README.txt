# Configuración de Cluster Kubernetes con Ansible
# Autor: Francisco Javier Gutierrez | Unix/Linux Architect & Cloud Engineer

## Introducción:
Este proyecto contiene un conjunto de playbooks de Ansible para configurar un clúster de Kubernetes de alta disponibilidad con 3 nodos master y 4 nodos workers, 
utilizando HAProxy y Keepalived para la alta disponibilidad.

## Estructura del Proyecto
El proyecto está organizado de la siguiente manera:

Kubernetes_cluster_HA_Banco_Ganadero/
 └──kubernetes_cluster_playbooks/
    ├── main.yml
    ├── instalar_dependencias.yml
    ├── configurar_containerd.yml
    ├── configurar_firewalld.yml
    ├── configurar_haproxy.yml
    ├── configurar_keepalived.yml
    ├── configurar_kubernetes.yml
    ├── configurar_metallb.yml
    ├── limpiar_kubernetes.yml   <--- Este playbook limpia configuraciones de Kubernetes con el fin de inicializar una nueva configuración
    ├── files/
    |   └── containerd-config.toml
    └── templates/
            ├── haproxy.cfg.j2
            └── keepalived.conf.j2

## Inventory
Hosts que componen el cluster

[masters]
master1 ansible_host=172.16.1.91
master2 ansible_host=172.16.1.92
master3 ansible_host=172.16.1.93

[workers]
worker1 ansible_host=172.16.1.94
worker2 ansible_host=172.16.1.95
worker3 ansible_host=172.16.1.96
worker4 ansible_host=172.16.1.97

## Playbooks

### kubernetes_cluster
Este folder contiene todos los playbooks para instalar y configurar un clúster de Kubernetes de alta disponibilidad con HAProxy y Keepalived.

#### Tareas Principales:

- `instalar_dependencias.yml`: Instala las dependencias necesarias.
- `configurar_containerd.yml`: Instala y configura Containerd.
- `configurar_firewall.yml`: Configura las reglas del firewall.
- `configure_haproxy.yml`: Configura y asegura HAProxy (Alta disponibilidad).
- `configure_keepalived.yml`: Configura y asegura Keepalived.
- `configurar_kubernetes.yml`: Configurar Kubernetes, inicializar nodos, instalar CNI y unir nodos al cluster
- `configurar_metallb.yml`: Configurar el balanceador de carga de las aplicaciones/deployments.
- `limpiar_kubernetes.yml`: Reset de las configuraciones cn el fin de inicializasr una nueva.



#### Archivos Importantes:
Files:
- `containerd-config.toml`: Archivo de configuración para Containerd.
Templates:
- `haproxy.cfg.j2`: Plantilla para configurar HAProxy.
- `keepalived.conf.j2`: Plantilla para configurar Keepalived.
- `check_haproxy.sh`: Script de vigilancia del estado del servicio haproxy.

## Ejecución

1. Asegúrese de tener Ansible instalado
2. Asegúrese de que todos los nodos están configurados correctamente en el archivo `inventory`.
3. Es recomendable ejecutar cada playbook individualmente con el fin de tener un mayor control y seguimiento del proceso, 
   para ello ejecute los playbooks de la siguiente manera:

   Comando:
   --------
    ansible-playbook -i ansible-playbook -i inventory /kubernetes_cluster/<playbook.yml>

   Ejemplo:
    ansible-playbook -i inventory kubernetes_cluster/instalar_dependencias.yml
   
   Orden de ejecución:
   -------------------
   instalar_dependencias.yml
   configurar_containerd.yml
   configurar_firewalld.yml
   configurar_haproxy.yml
   configurar_keepalived.yml
   configurar_kubernetes.yml
   configurar_metallb.yml

   
    




