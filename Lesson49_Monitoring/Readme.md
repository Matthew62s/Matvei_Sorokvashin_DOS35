Установим prometheus с помощью docker
## В качестве exporter возьмем node exporter под сбор системных и архитектурных метрик lunux
```
Создадим папки 
mkdir -p /opt/prometheus /opt/prometheus/prometheus_data
Создадим файл конфигурации /opt/prometheus/prometheus.yml

global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'prometheus'
    static_configs:
      - targets: ['localhost:9090']
  - job_name: 'node_exporter'
    static_configs:
      - targets: ['host.docker.internal:9100']

Опишим docker-compose.yml

version: '3.8'

services:
  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    restart: unless-stopped
    ports:
      - "9090:9090"
    volumes:
      - ./prometheus.yml:/etc/prometheus/prometheus.yml
      - prometheus_data:/prometheus
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
      - '--storage.tsdb.path=/prometheus'
    extra_hosts:
      - "host.docker.internal:host-gateway"

  node_exporter:
    image: quay.io/prometheus/node-exporter:latest
    container_name: node_exporter
    restart: unless-stopped
    network_mode: host
    pid: host
    command:
      - '--path.rootfs=/host'
    volumes:
      - '/:/host:ro,rslave'

volumes:
  prometheus_data:

```
## Перейдем по http://public-ip:990
<img width="1909" height="893" alt="Health" src="https://github.com/user-attachments/assets/9a8375ec-aa2d-4ec7-9dad-bd1be0edfb47" />
## Попробуем получить любую тестовую метрику
<img width="1909" height="900" alt="PromQL" src="https://github.com/user-attachments/assets/967eb05a-7059-421d-8605-c9082fc979c2" />
## Запрос выполнен успешно

