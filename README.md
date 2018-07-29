# MiOpenCV
Librería para uso de OpenCV en Lazarus.

Basado en los trabajos de:
* http://gidesa.altervista.org/camshiftdemo.php
* https://github.com/zbyna/opencv-lazarus


Adaptado para trabajar con Windows y Linux. 

Por defecto está configurado para trabajar con OpenCV en la versión 2.4.13 (En Windows) y 2.4.9 (En linux), si bien puede cambiarse a otra versión si no difiere mucho de las mencionadas.

OpenCV debe estar previamente instalado en la PC donde se va a ejecutar. Esto significa que los archivos *.dll (en Windows) o los archivos *.so (en linux) deben estar accesibles a la aplicación.

* Para Windows, descargar los *.dll de https://opencv.org/releases.html (Descargar ejecutable y expandir carpeta para obtener los archivos *.dll).

* Para Linux se debe instalar OpenCV ejecutando en el terminal: sudo apt-get install libopencv-dev
