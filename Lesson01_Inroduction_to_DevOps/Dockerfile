FROM debian:latest
WORKDIR /app
COPY install_apt_packages.sh /app
ENTRYPOINT [ "sh", "/app/install_apt_packages.sh" ]
CMD ["echo", "container started"] 
