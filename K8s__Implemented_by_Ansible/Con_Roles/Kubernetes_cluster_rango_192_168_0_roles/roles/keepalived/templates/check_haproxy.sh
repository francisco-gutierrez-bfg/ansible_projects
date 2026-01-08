#!/bin/bash
# Autor: Francisco Javier Gutierrez | Unix/Linux Architect & Cloud Engineer

# Function to check HAProxy status
check_haproxy() {
    local status=$(curl -s -o /dev/null -w "%{http_code}" $HAPROXY_STATS_URL)
    if [ $status -eq 200 ]; then
        echo "HAProxy se encuentra conrriendo"
        exit 0
    else
        echo "HAProxy está muerto (HTTP status: $status)"
        exit 1
    fi
}

# Main execution
check_haproxy
