# Этап сборки
FROM python:3.9-slim as builder

WORKDIR /ctr_app

# Копируем только requirements.txt для кэширования слоя
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --user --timeout 1000 -r requirements.txt

# Финальный этап
FROM python:3.9-slim

WORKDIR /ctr_app

# Копируем установленные зависимости из этапа сборки
COPY --from=builder /root/.local /root/.local
COPY . .

# Убедимся, что скрипты в .local доступны в PATH
ENV PATH=/root/.local/bin:$PATH

# Указываем порт, который будет использоваться
EXPOSE 8000

# Запускаем приложение
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]