# ====== Этап 1: Сборка зависимостей ======
FROM python:3.9-slim AS builder

WORKDIR /ctr_app

# Устанавливаем системные зависимости для сборки
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Копируем файл зависимостей
COPY requirements.txt .

# Устанавливаем зависимости в локальную папку
RUN python -m pip install --no-cache-dir --user -r requirements.txt

# ====== Этап 2: Финальный контейнер ======
FROM python:3.9-slim

WORKDIR /ctr_app

# Копируем зависимости
COPY --from=builder /root/.local /root/.local

# Добавляем локальные библиотеки в PATH
ENV PATH=/root/.local/bin:$PATH

# Копируем приложение
COPY . .

# Открываем порт
EXPOSE 8000

# Запуск приложения
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
