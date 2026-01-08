# Configuración de Cluster Kubernetes con Ansible
# Autor: Francisco Javier Gutierrez | Unix/Linux Architect & Cloud Engineer

## Introducción:
Este proyecto contiene un conjunto de playbooks de Ansible para configurar un clúster de Kubernetes de alta disponibilidad con 3 nodos master y 4 nodos workers, utilizando HAProxy y Keepalived para la alta disponibilidad.
Nota: Asegúrese que el rango de ips sea el correcto, este proyecto fue elaborado en un laboratorio con un rango de IPs 192.168.0.x/24

## Estructura del Proyecto
El proyecto está organizado de la siguiente manera:

kubernetes_ansible/
├─ bg.yml
└─ roles/
   ├── dependencias/
   │   └── tasks/
   │       └── main.yml
   ├── firewalld/
   │   └── tasks/
   │       └── main.yml
   ├── containerd/
   │   └── tasks/
   │       ├── main.yml
   │       └── files
   │           └── configurar_containerd.yml
   ├── haproxy/
   │   └── tasks/
   │       ├── main.yml
   │       └── templates
   │           └── haproxy.cfg.j2
   ├── keepalived/
   │   └── tasks/
   │       ├── main.yml
   │       └── templates
   │           └── keepalived.conf.j2
   ├── init
   │   └── tasks/
   │       └── main.yml
   ├── master_secundarios
   │   └── tasks/
   │       └── main.yml
   ├── workers
   │   └── tasks/
   │       └── main.yml
   └── metallb
       └── tasks/
           └── main.yml


## Roles

- `dependencias`: Instala las dependencias necesarias.
- `containerd`: Instala y configura Containerd.
- `firewalld`: Configura las reglas del firewall.
- `haproxy`: Configura y asegura HAProxy (Alta disponibilidad).
- `keepalived`: Configura y asegura Keepalived.
- `init`: Configurar Kubernetes, inicializar nodo master, instalar CNI
- `master_secundarios`: Unir nodos master secundarios
- `workers`: Unir nodos worker
- `metallb`: Configurar el balanceador de carga de las aplicaciones/deployments.

## Utilidad de ñimpieza de configuraciones:
- `limpiar_kubernetes.yml`: Reset de las configuraciones cn el fin de inicializasr una nueva.


#### Archivos Importantes:

- `containerd-config.toml`: Archivo de configuración para Containerd.
- `haproxy.cfg.j2`: Plantilla para configurar HAProxy.
- `keepalived.conf.j2`: Plantilla para configurar Keepalived.

## Ejecución
1. Asegúrese de tener Ansible instalado
2. Asegúrese de que todos los nodos están configurados correctamente en el archivo `inventory`.
3. Ejecute el playbook principal desde el directorio raíz del proyecto:
   ansible-playbook -i inventory bg.yml
    




