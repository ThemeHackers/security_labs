#!/bin/bash

USER_HOME="/home/labs"

labs=(
    # You can add more labs if you have enough resources.
    "$USER_HOME/vulhub/webmin/CVE-2019-15107"
    "$USER_HOME/vulhub/cgi/CVE-2016-5385"
    "$USER_HOME/vulhub/joomla/CVE-2023-23752"
    "$USER_HOME/vulhub/php/CVE-2024-2961"
    "$USER_HOME/vulhub/supervisor/CVE-2017-11610"
    "$USER_HOME/vulhub/laravel/CVE-2021-3129"
    "$USER_HOME/vulhub/nexus/CVE-2024-4956"
    # More
)

for lab in "${labs[@]}"; do
    if [ -d "$lab" ]; then
        echo "Starting lab: $lab"
        (cd "$lab" && docker-compose up -d)
    else
        echo "❌ Directory not found: $lab"
    fi
done
