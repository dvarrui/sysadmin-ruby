
# Hello World!

## Instalación de Ruby

Para poder probar los ejemplos de esta guía, necesitaremos tener instalado Ruby en nuestro equipo. Este proceso de puede hacer de varias formas, pero aquí lo haremos por comandos:

**Instalación en OpenSUSE**

No es necesario, porque viene instalado por defecto.

**Instalación en Debian/Ubuntu**

* Abrir una consola como usuario root.
* `apt-get install ruby`, para instalar Ruby.
* `apt-get install irb`, para instalar el intérprete interactivo de Ruby.

`irb` no es necesario para ejecutar nuestros scripts de Ruby, pero si es útil para depurar nuestros scripts y hacer pruebas para conocer mejor el lenguaje. De modo que lo instalaremos también.

## Script helloworld.sh

Es casi una costumbre empezar a aprender un nuevo lenguaje de programación creando el programa HelloWorld. Primero vamos a ver la versión HelloWorld de Bash para luego compararla con Ruby.

Ejemplo de programa [helloworld.sh](example/helloworld.sh) en bash:
```bash
#!/bin/bash
echo "Hello World!"
```

Para ejecutar el programa, hacemos:
* `chmod +x helloworld.sh`, para asignarle permisos de ejecución al fichero.
* `./helloworld.sh`, para ejecutarlo.

Ejemplo:
```
> ./helloworld.sh
Hello World!
```

El script de Bash es un fichero de texto que contiene principalmente comandos del sistema. Estos comandos se ejecutarán al iniciarse script.

La primera línea del script con `#!`, es un indicativo para saber qué programa será el resposable de ejecutar las instrucciones del script. Los scripts son programas interpretados. Esto es, están en un lenguaje que la máquina no entiende, por tanto se requiere que un programa (intérprete) las lea y las vaya traduciendo al lenguaje de la máquina mientras se ejecutan.

## Script helloworld.rb

Vamos a ver el ejemplo anterior en versión Ruby. Fichero [helloworld.rb](example/helloworld.rb):
```ruby
#!/usr/bin/env ruby
puts "Hello World!"
```

Para ejecutar el programa, podemos hacer `ruby helloworld.rb`. Pero por comodidad vamos a hacer el mismo proceso que con el script de Bash:
* `chmod +x helloworld.rb`, para asignarle permisos de ejecución al fichero.
* `./helloworld.rb`, para ejecutarlo.


helloworld.rb
chmod +x
#!
helloworld.sh

sin extensión
/usr/local/bin
