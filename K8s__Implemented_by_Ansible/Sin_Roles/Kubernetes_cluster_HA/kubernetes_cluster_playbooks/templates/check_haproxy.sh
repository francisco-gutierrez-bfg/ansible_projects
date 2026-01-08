#!/bin/bash
# Configuración de Cluster Kubernetes con Ansible
# Autor: Francisco Javier Gutierrez | Unix/Linux Architect & Cloud Engineer

# Función que revisa el estado de HAProxy
check_haproxy() {
    local status=$(curl -s -o /dev/null -w "%{http_code}" $HAPROXY_STATS_URL)
    if [ $status -eq 200 ]; then
        echo "El servicio de HAProxy se encuentra conrriendo"
        exit 0
    else
        echo "El servicio de HAProxy no está disponible, (HTTP status: $status)"
        exit 1
    fi
}

# Ejecución principal
check_haproxy
