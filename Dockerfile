# Stage 1: Build stage
FROM python:3.9-slim as build

# Устанавливаем зависимости для сборки (если в requirements.txt есть пакеты, требующие компиляции)
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ctr_app

# Копируем файл зависимостей отдельно для кеширования
COPY requirements.txt .

# Устанавливаем зависимости (логируем процесс для отладки)
RUN pip install --no-cache-dir --timeout 1000 -r requirements.txt || (cat requirements.txt && exit 1)

# Stage 2: Final stage
FROM python:3.9-slim

# Устанавливаем минимальные зависимости
RUN apt-get update && apt-get install -y --no-install-recommends nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ctr_app

# Копируем только нужные файлы из build-stage
COPY --from=build /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=build /usr/local/bin /usr/local/bin
COPY . .

# Запуск приложения
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]