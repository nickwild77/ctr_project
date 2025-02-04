# Этап сборки
FROM python:3.9-slim AS builder

WORKDIR /ctr_app

# Копируем только файл зависимостей для кэширования слоя
COPY requirements.txt .

# Устанавливаем зависимости с кэшированием
RUN --mount=type=cache,target=/root/.cache/pip \
    python -m pip install --no-cache-dir --upgrade pip && \
    python -m pip install --no-cache-dir --user -r requirements.txt

# Финальный этап
FROM python:3.9-slim

WORKDIR /ctr_app

# Копируем зависимости из builder
COPY --from=builder /root/.local /root/.local

# Убедимся, что локальные пакеты доступны в PATH
ENV PATH=/root/.local/bin:$PATH

# Копируем приложение
COPY . .

# Открываем порт
EXPOSE 8000

# Используем ENTRYPOINT для удобства
ENTRYPOINT ["uvicorn", "app:app"]

# Запускаем приложение
CMD ["--host", "0.0.0.0", "--port", "8000"]