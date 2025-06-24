#!/bin/bash


GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RED='\033[0;31m'
RESET='\033[0m'

echo -e "${CYAN}🔍 Checking for running Vulhub services...${RESET}"
echo "==================================================="

docker ps --format '{{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}\t{{.Label "com.docker.compose.project.working_dir"}}' | while IFS=$'\t' read -r name image ports status workdir; do

    if [[ "$workdir" == *vulhub* ]]; then
        echo -e "${GREEN}📦 Container:${RESET} $name"
        echo -e "${YELLOW}   📁 From:${RESET} $workdir"
        echo -e "${YELLOW}   🐳 Image:${RESET} $image"
        echo -e "${YELLOW}   🔌 Ports:${RESET} ${ports:-N/A}"
        echo -e "${YELLOW}   ⏱ Status:${RESET} $status"
        echo "---------------------------------------------------"
    fi

done

echo ""
echo -e "${CYAN}✅ Done. Only running containers from Vulhub shown.${RESET}"
