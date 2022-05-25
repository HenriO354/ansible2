FROM wordpress 
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
RUN mkdir /var/www/wordpress
RUN mv /var/www/html/* /var/www/wordpress
RUN sed -i 's:html:wordpress:' /etc/apache2/sites-available/000-default.conf
RUN service apache2 restart
WORKDIR /var/www/wordpress