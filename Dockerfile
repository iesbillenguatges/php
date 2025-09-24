# Dockerfile
FROM debian:stable-slim
# Evitar preguntes interactives en l'apt
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
 && apt-get install -y  \
      apache2 \
      php
      
EXPOSE 80
# Comanda per executar Apache en primer pla (container actiu)
CMD ["apache2ctl", "-D", "FOREGROUND"]
