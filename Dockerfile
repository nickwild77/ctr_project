# Stage 1: Build stage
FROM python:3.9-slim as build

# Устанавливаем зависимости для сборки
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ctr_app

# Копируем только файл зависимостей сначала, чтобы использовать кеширование слоев
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir --timeout 1000 -r requirements.txt

# Stage 2: Final stage
FROM python:3.9-slim

# Устанавливаем минимальные зависимости (без build-утилит)
RUN apt-get update && apt-get install -y --no-install-recommends nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ctr_app

# Копируем только нужные файлы из build-stage
COPY --from=build /ctr_app /ctr_app

# Запуск приложения
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
