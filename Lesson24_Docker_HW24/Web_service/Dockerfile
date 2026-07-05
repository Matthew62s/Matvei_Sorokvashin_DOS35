FROM ubuntu:latest
RUN apt-get update && apt-get install nginx curl -y
RUN mkdir -p /app/static
COPY ./static /app/static/
COPY ./nginx.conf /etc/nginx/
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
