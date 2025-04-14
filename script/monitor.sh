#!/bin/bash

# === CONFIGURAZIONI ===
HOSTS_FILE="hosts.txt"           # File contenente gli IP o hostname da monitorare
SERVICES_FILE="services.txt"     # File contenente i nomi dei servizi da controllare
LOG_DIR="logs"                   # Cartella dove salvare i log
LOG_FILE="$LOG_DIR/monitor-$(date +%Y%m%d).log"  # File log con data corrente

# === CREAZIONE CARTELLA LOG SE NON ESISTE ===
mkdir -p "$LOG_DIR"

echo "$(date) - Inizio monitoraggio" >> "$LOG_FILE"

# === MONITORAGGIO HOST ===
echo "--- Monitoraggio host ---" >> "$LOG_FILE"
while read -r host; do
    if ping -c 1 -W 1 "$host" > /dev/null 2>&1; then
        echo "[OK] Host raggiungibile: $host" >> "$LOG_FILE"
    else
        echo "[ERRORE] Host NON raggiungibile: $host" >> "$LOG_FILE"
    fi
done < "$HOSTS_FILE"

# === MONITORAGGIO SERVIZI LOCALI ===
echo "--- Monitoraggio servizi locali ---" >> "$LOG_FILE"
while read -r service; do
    if systemctl is-active --quiet "$service"; then
        echo "[OK] Servizio attivo: $service" >> "$LOG_FILE"
    else
        echo "[ERRORE] Servizio NON attivo: $service" >> "$LOG_FILE"
    fi
done < "$SERVICES_FILE"

echo "$(date) - Monitoraggio completato" >> "$LOG_FILE"
