FROM php:8.2-apache

# Enable Apache Rewrite Module
RUN a2enmod rewrite

# Change Apache to listen on the port Render provides
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

WORKDIR /var/www/html

# Copy project files
COPY . .

EXPOSE 8080

# Start Apache
CMD ["apache2-foreground"]
