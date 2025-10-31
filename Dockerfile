FROM php:8.2-apache

# Install mysqli and other useful PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql && docker-php-ext-enable mysqli pdo_mysql

# Enable Apache Rewrite Module
RUN a2enmod rewrite

# Set working directory
WORKDIR /var/www/html

# Copy project files
COPY . .

# Expose port
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
