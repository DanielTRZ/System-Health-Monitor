
#!/bin/bash

# ==========================================
# SYSTEM HEALTH MONITOR 🚀
# Autor: Daniel
# ==========================================

# Kolory dla lepszej widoczności
GREEN='\033[0;32m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}=== Sprawdzanie stanu systemu dla Daniel ===${NC}"

# 1. Sprawdzanie zużycia dysku
echo -e "\n${GREEN}[1/3] Miejsce na dysku:${NC}"
df -h | grep '^/dev/' | awk '{ print $1 ": " $5 " zużycia (" $4 " wolnego)" }'

# 2. Sprawdzanie pamięci RAM
echo -e "\n${GREEN}[2/3] Pamięć RAM:${NC}"
free -h | awk '/^Mem:/ { print "Zużyto: " $3 " / Razem: " $2 }'

# 3. Sprawdzanie obciążenia procesora (CPU)
echo -e "\n${GREEN}[3/3] Obciążenie CPU:${NC}"
uptime | awk -F'load average:' '{ print "Średnie obciążenie:" $2 }'

# 4. Sprawdzenie czy system wymaga restartu (dla Ubuntu/Debian)
if [ -f /var/run/reboot-required ]; then
    echo -e "\n${RED}⚠️  Wymagany restart systemu!${NC}"
else
    echo -e "\n${GREEN}✅ System jest aktualny.${NC}"
fi

echo -e "\n${BLUE}=== Raport zakończony ===${NC}"

