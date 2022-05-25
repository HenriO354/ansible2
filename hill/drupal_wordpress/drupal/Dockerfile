FROM wordpress 
RUN echo "ServerName 127.0.0.1" >> /etc/apache2/apache2.conf
RUN mkdir /var/www/drupal
RUN mv /var/www/html/* /var/www/drupal
RUN sed -i 's:html:drupal:' /etc/apache2/sites-available/000-default.conf
RUN service apache2 restart
WORKDIR /var/www/drupal