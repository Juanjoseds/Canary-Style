# Canary Style

## Introducción

__Canary Style__ es una página web de comercio online basada en una tienda de ropa y complementos.

Esta web está desarrollada desde un principio en *Ruby on Rails*, con el fin de proporcionar una gran eficacia con el uso de base de datos y la potencia del framework Rails.

Para simular un entorno similar al que se ha programado, debe cumplir los siguientes requisitos:

| Programa      | Versión           |
| :---:         |    :----:         |
| Ruby          | 2.3.3p222         |
| Rails         | 5.1.7             |
| gem           | 3.0               |
|sqlite3        |1.3.13 x86-mingw32 |
| PostgreSQL    |12.1               |

> Se ha instalado *Ruby on Rails* en __Windows 10__.
><br>Importante leer el proceso de instalación.

## Instalación

Instalar *Ruby on Rails* en __Windows 10__ puede dar serios problemas de instalación, por ello es importante seguir los pasos.

1. Instalar *Ruby on Rails* en un directorio raíz (como C:/ ) desde [Railsintaller](http://railsinstaller.org/en).
2. Abrir la **cmd** y ejecutar ``gem update``.
3. Usando el comando ``cd`` nos dirigimos a la carpeta donde queramos copiar el proyecto.
4. Para clonar el proyecto usando git escribimos ``git clone https://github.com/Juanjoseds/Canary-Style``.
5. Instalar [PostgreSQL](https://www.postgresql.org/).
6. Situate con la **cmd** encima del proyecto y escribe ``bundle install``.
7. Ejecuta el comando ``rails db:migrate``
7. Para ejecutar la página escriba ``rails s`` para ejecutar el servidor.
8. La página deberá estar funcionando en ``localhost:3000``.

## La página

