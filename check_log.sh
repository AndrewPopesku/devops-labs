#!/bin/bash

# Шлях до файлу
FILE="/var/log/my-app.log"

# Шлях до файлу для зберігання часу останньої перевірки
LAST_CHECK_FILE="/tmp/last_check_time"

# Отримати останній час зміни файлу
LAST_MODIFIED=$(stat -c %Y "$FILE")

# Отримати розмір файлу
FILE_SIZE=$(stat -c %s "$FILE")

# Перевірка, чи існує файл з останнім часом перевірки
if [ -f "$LAST_CHECK_FILE" ]; then
    # Отримати час останньої перевірки
    LAST_CHECK=$(cat "$LAST_CHECK_FILE")

    # Порівняти час останньої перевірки з часом зміни файлу
    if [ "$LAST_MODIFIED" -gt "$LAST_CHECK" ]; then
        # Записати нову інформацію в Redis
        redis-cli HMSET log_info size "$FILE_SIZE" modified_at "$(date -d @"$LAST_MODIFIED" '+%Y-%m-%d %H:%M:%S')"

        # Оновити час останньої перевірки
        echo "$LAST_MODIFIED" > "$LAST_CHECK_FILE"
    fi
else
    # Якщо файл не існує, записати час зміни і інформацію про файл у Redis
    redis-cli HMSET log_info size "$FILE_SIZE" modified_at "$(date -d @"$LAST_MODIFIED" '+%Y-%m-%d %H:%M:%S')"

    # Створити файл для зберігання часу останньої перевірки
    echo "$LAST_MODIFIED" > "$LAST_CHECK_FILE"
fi
