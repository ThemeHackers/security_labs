#!/bin/bash


if ! command -v docker-compose &> /dev/null; then
    echo "❌ docker-compose not found. Please install it first."
    exit 1
fi

labs=(
    # You can add more labs if you have enough resources.
    "vulhub/webmin/CVE-2019-15107"
    "vulhub/cgi/CVE-2016-5385"
    "vulhub/joomla/CVE-2023-23752"
    "vulhub/php/CVE-2024-2961"
    "vulhub/supervisor/CVE-2017-11610"
    "vulhub/laravel/CVE-2021-3129"
    "vulhub/nexus/CVE-2024-4956"
    # More
)


BASE_DIR=$(pwd)

start_lab() {
    local lab_relpath=$1
    local lab_abs_path="$BASE_DIR/$lab_relpath"

    if [ -d "$lab_abs_path" ]; then
        echo "🚀 Stoping lab: $lab_abs_path"
        (cd "$lab_abs_path" && docker-compose down )
        if [ $? -eq 0 ]; then
            echo "✅ Lab stoped successfully: $lab_abs_path"
        else
            echo "⚠️ Failed to stop lab: $lab_abs_path"
        fi
    else
        echo "❌ Directory not found: $lab_abs_path"
    fi
}

for lab in "${labs[@]}"; do
    start_lab "$lab"
done
