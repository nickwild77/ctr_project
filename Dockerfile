# Stage 1: Build dependencies
FROM python:3.9-slim as build

# Устанавливаем зависимости для компиляции
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ctr_app

# Копируем файлы проекта
COPY . .

# Устанавливаем зависимости
RUN pip install --no-cache-dir --timeout 1000 -r requirements.txt

# Stage 2: Production image
FROM python:3.9-slim

# Устанавливаем только необходимые пакеты
RUN apt-get update && apt-get install -y --no-install-recommends nano \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /ctr_app

# Копируем установленные библиотеки
COPY --from=build /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=build /usr/local/bin /usr/local/bin

# Копируем код приложения
COPY . .

# Запуск приложения
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000"]
