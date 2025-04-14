# Simple NOC Monitor

Uno script semplice in Bash pensato per attività di monitoraggio base da parte di un sistemista NOC. Esegue controlli su host di rete e servizi locali, scrivendo i risultati in file di log giornalieri.

---

## ✅ Funzionalità

- Ping automatico di host specificati in un file (`hosts.txt`)
- Verifica dello stato di servizi locali con `systemctl`
- Log strutturato e datato nella cartella `logs/`
- Facilmente estendibile o schedulabile con `cron`

---

## ⚙️ Requisiti

- Linux con `bash`
- Comandi `ping` e `systemctl`

---

## 📂 Struttura del progetto


simple-noc-monitor/
├── monitor.sh          # Script principale
├── hosts.txt           # Lista di host/IP da pingare
├── services.txt        # Lista di servizi da monitorare
├── logs/               # Cartella dove vengono salvati i log
└── README.md           # Descrizione del progetto



## 🔧 Come usarlo

1. Clona il repository o copia i file
2. Rendi eseguibile lo script:


chmod +x monitor.sh

3. Inserisci gli host nel file `hosts.txt` (uno per riga):

127.X.X.X
8.8.8.8
192.X.X.X

4. Inserisci i servizi nel file `services.txt`:

ssh
cron
apache2


5. Esegui lo script:
./monitor.sh



6. Leggi i log nella cartella `logs/`:
cat logs/monitor-YYYYMMDD.log



## 📊 Esempio di Output


lun 14 apr 2025, 09:56:57, CEST - Inizio monitoraggio
--- Monitoraggio host ---
[OK] Host raggiungibile: 192.X.X.X
[OK] Host raggiungibile: 127.X.X.X
[OK] Host raggiungibile: 8.8.8.8
--- Monitoraggio servizi locali ---
[ERRORE] Servizio NON attivo: ssh
[OK] Servizio attivo: cron
[ERRORE] Servizio NON attivo: apache2
lun 14 apr 2025, 09:56:57, CEST - Monitoraggio completato
