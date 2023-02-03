FROM ubuntu
RUN apt update -y && apt upgrade -y
RUN DEBIAN_FRONTEND="noninteractive" apt install apache2 git -y
RUN cd /var/www && git clone https://github.com/sofkauniversity/PracticaHojaVida.git ## url a cambiar
RUN sed -i "s|DocumentRoot /var/www/html|DocumentRoot /var/www/PracticaHojaVida|g" /etc/apache2/sites-available/000-default.conf
EXPOSE 80
ENTRYPOINT /usr/sbin/apache2ctl -D FOREGROUND

##NOTA: en el cuarto paso, se deberá cambiar la de git por la url del ## repositorio en el cual se tiene la hojavida de cada uno 