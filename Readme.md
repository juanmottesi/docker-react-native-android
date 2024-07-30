# React Native Android Build Environment

Este repositorio contiene un Dockerfile para configurar un entorno de construcción para aplicaciones React Native en Android.

## Contenido

- [Requisitos](#requisitos)
- [Detalles del Dockerfile](#detalles-del-dockerfile)

## Requisitos

- Docker instalado en tu sistema. Puedes descargarlo e instalarlo desde [aquí](https://www.docker.com/products/docker-desktop).


## Detalles del Dockerfile

El Dockerfile incluido en este repositorio configura el entorno necesario para compilar aplicaciones React Native en Android. A continuación, se detallan los pasos realizados:

1. **Configuración del Entorno Java**:
    - Actualiza y mejora los paquetes existentes.
    - Instala OpenJDK 17.

2. **Configuración del Entorno Android**:
    - Descarga y configura las herramientas de línea de comandos de Android
    - Instala las herramientas de la plataforma (34.0.5).
    - Acepta las licencias y actualiza el SDK de Android.
    - Instala las plataformas y herramientas necesarias para compilar aplicaciones Android, incluyendo `platforms;android-34`, `build-tools;34.0.0`, `cmake;3.22.1`, y `ndk;25.1.8937393`.

3. **Comando por Defecto**:
    - El contenedor inicia con `/bin/bash` para permitir la interacción manual.

