
# Instalar software

Cada vez que instalo el sistema operativo , suelo personalizarlo con los programas que uso habitualmente. Entonces vamos a crear un script para que nos ayude a personalizar la instalación del software de nuestro sistema.

## Crear un script para personalizar nuestro software

Primero necesitamos definir la entrada de datos. Esta va a ser un fichero de texto que contenga la lista de todos los paquetes que queremos instalar. Ejemplo [software-list.txt](example/software-list.txt)

```
tree
vim
gedit
nmap
```

Ahora haremos un script [install.rb](example/myinstall.rb) que lea el contenido del fichero. Separe cada línea para identificar el nombre de cada paquete y luego ejecute los comandos necesarios para instalar dicho paquete.


```
> ./myinstall.rb                                 
Usage: ./myinstall.rb FILENAME
       FILENAME is a text file with a list of package names.

> ./myinstall.rb software-list.txt

Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'tree' not installed!
Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'vim' not installed!
Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'gedit' not installed!
Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'nmap' not installed!
```

Hay que controlar que hayamos iniciado sesión con el usuario `root`.

## Añadiendo controles al proceso de instalación

Hacemos la segunda versión llamada [install2.rb](example/install2.rb), donde añadimos el control de usuario "root":

```ruby
unless `whoami`.chop == 'root'
  puts "[ERROR] Run as \'root\' user!"
  exit 1
end
```

Se nos ocurre que podríamos dar un toque de "color" a los mensajes de nuestros scripts. Sobre todo para remarcar aquellas partes que deban destacarse y poner en rojo lo errores. Para esto vamos a instalar una librería o gema Ruby llamada "Rainbow". Abrimos una consola y ejecutamos `gem install rainbow` como superusuario. La herramienta o ocmando gem ya lo tenemos en nuestro sistema. Se instaló junto con ruby.

```ruby
#!/usr/bin/env ruby
require 'rainbow'

if ARGV.empty?
  puts "Usage: #{$0} FILENAME"
  puts "       FILENAME is a text file with a list of package names."
  exit 1
end

unless `whoami`.chop == 'root'
  puts Rainbow("[ERROR] Run as \'root\' user!").red.bright
  exit 1
end
```

Explicación:
* Con `require 'rainbow'` cargamos la librería (o gema) Rainbow.
* `puts Rainbow("ERROR").red.bright`, muestra el texto ERROR coloreado en rojo brillante.

Si quieres ver qué otras funciones o colores tiene Rainbow, lee [este enlace](https://github.com/sickill/rainbow).

Tenemos que:
1. El script muestra una ayuda cuando se ejecuta sin parámetros.
2. Muestra un error cuando no se ejecuta con el superusuario root.
3. Instala los paquetes del fichero que se pasa por parámetros.

> El comando de instalación "zypper install -y ..." funciona con OpenSUSE, si tenemos Debian/Ubuntu deberemos sustituirlo por "apt-get install -y".


instalar y desinstalar paquetes
system
zypper in
zypper remove
zypper se
apt

package-manager.rb
