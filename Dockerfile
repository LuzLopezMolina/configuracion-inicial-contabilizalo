# Usar una imagen base oficial de PHP
FROM php:8.2-fpm-alpine

# Instalar las dependencias necesarias
RUN apk update && apk add --no-cache \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    zip \
    git \
    curl \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd \
    && docker-php-ext-install pdo pdo_mysql




# Establecer el directorio de trabajo
WORKDIR /var/www

# Copiar el código de la aplicación al contenedor
COPY . .

# Instalar Composer (si es necesario)
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Exponer el puerto 9000 para PHP
EXPOSE 9000

CMD ["php-fpm"]
