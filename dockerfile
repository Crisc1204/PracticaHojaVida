FROM ubuntu
RUN apt update -y && apt upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt install apache2 git -y
RUN cd /var/www && git clone https://github.com/Crisc1204/PracticaHojaVida.git
RUN sed -i "s|DocumentRoot /var/www/html|DocumentRoot /var/www/PracticaHojaVida|g" /etc/apache2/sites-available/000-default.conf
EXPOSE 80
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND