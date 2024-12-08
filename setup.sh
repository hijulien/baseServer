#!/bin/bash

# 创建 /var/data 文件夹
if [ ! -d "/var/data" ]; then
  echo "Creating /var/data directory..."
  sudo mkdir -p /var/data
else
  echo "/var/data directory already exists, skipping creation."
fi

# 运行当前目录的 docker-compose.yml
echo "Running docker-compose.yml..."
docker compose up -d

# 设置权限
echo "Setting permissions for /var/data directory..."
sudo chmod -R 777 /var/data

# 检查 docker-compose 是否成功运行
if [ $? -eq 0 ]; then
  echo "Docker Compose started successfully!"
else
  echo "Docker Compose failed to start. Please check the error logs."
fi
