# Dockerfile
FROM debian:stable-slim
# Evitar preguntes interactives en l'apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y  \
      apache2 \
      libapache2-mod-php \
      php \
      ca-certificates 

EXPOSE 80

# Comanda per executar Apache en primer pla (container actiu)
CMD ["apache2ctl", "-D", "FOREGROUND"]
