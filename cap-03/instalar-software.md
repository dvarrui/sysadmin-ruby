
# Instalar software

Cada vez que instalo el sistema operativo , suelo personalizarlo con los programas que uso habitualmente. Entonces vamos a crear un script para que nos ayude a personalizar la instalación del software de nuestro sistema.

---
## 1. Primer intento

Nuestro primero intento es [softwarectl.rb](example/softwarectl.rb):

```ruby
#!/usr/bin/env ruby

##
# Install OS packages
def install_packages
  system("zypper install -y tree")
  system("zypper install -y nmap")
  system("zypper install -y vim")
end

##
# Remove OS packages
def remove_packages
  system("zypper remove -y tree")
  system("zypper remove -y nmap")
  system("zypper remove -y vim")
end

##
# Choose action from input argument
if ARGV.first == '--install'
  install_packages
elsif ARGV.first == '--remove'
  remove_packages
else
  puts "Usage: #{$0} [--install|--remove]"
  puts ""
  puts "Options: "
  puts "         --install, install packages"
  puts "         --remove, remove packages"
  exit 1
end
```

Bueno, a simple vista podemos ver que el script tiene 3 partes:
1. Una primera donde se define un método que se encargará de instalar los paquetes especificados en el sistema operativo. Se usa el comando `zypper install -y PACKAGENAME` porque hago mis pruebas en OpenSUSE. Si tienes Debian lo puee cambiar por `apt-get install -y PACKAGENAME`.
2. Una segunda parte donde se define un método para desinstalar lo paquetes especificados.
3. Una parte final donde se comprueba el valor del primer argumento. Y en función de su valor (`--install` o `--remove`) se ejecuta una accion u otra.

Problemas:
1. Hay que poner muchas líneas `system`... y estamos incumpliendo una norma de todo buen programador: `DRY = Don't Repeat Yourself`.
2. Cada vez que cambia nuestra lista de paquetes hay que cambiar los dos métodos del script. Y eso... no es bueno. El script NO debería tocarse (modificarse) para usarlo.

---
## 2. Segunda versión con Iterador

El script anterior tiene muchas líneas repetidas. Cuando tenemos líneas que se repiten... hay que poner un bucle para simplificar o mejor aún, un iterador.

Hacemos [softwarectl2.rb](example/softwarectl2.rb) donde sustituimos las líneas de código con repetidas por iteradores de la forma siguiente:

```ruby
# Package names list
packages = [ 'tree', 'nmap', 'vim', 'geany' ]

##
# Install OS packages
def install(packages)
  packages.each do |package|
    system("zypper install -y #{package}")
  end
end
```

Vemos que tenemos un Array `packages` con la lista de todos los paquetes. Y usamos el método `each` para iterar sobre dicho Array e invocar la acción `system ...` a cada elemento de la lista.

Hemos conseguido mejorar en:
1. El script tiene menos líneas.
2. El código es más legible usando iteradores. Cumplimos con la nomrma DRY.
3. Cada vez que necesitemos personalizar la lista de paquetes sólo debemos modificar el Array `packages`. Por ese motivo, lo hemos puesto al comienzo del script, así no hay que tocar nada más del script.

Problemas:
1. Cada vez que cambia nuestra lista de paquetes debemos "modificar" el script. Eso... no es bueno.

---
## 3. Separar el código de los datos

Para mejorar el problema del script anterior, Vamos a nacesitar 2 ficheros:
1. Un script que realiza la instalación o de los paquetes.
2. Un fichero de texto que contenga el listado de los paquetes.

Cuando terminemos tendremos un script que no cambia y un fichero de texto que se personaliza para cada usuario y/o instalación.

**Entrada de datos**

Primero necesitamos definir la entrada de datos. Esta va a ser un fichero de texto que contenga la lista de todos los paquetes que queremos instalar. Ejemplo [package-list.txt](example/package-list.txt)

```
tree
vim
gedit
nmap
```

**Script**

Ahora haremos un script [softwarectl3.rb](example/softwarectl3.rb) que lea el contenido del fichero. Separe cada línea para identificar el nombre de cada paquete y luego ejecute los comandos necesarios para instalar dicho paquete.

```
> ./softwarectl3.rb                                 
Usage: ./softwarectl.rb FILENAME
       FILENAME is a text file with a list of package names.

> ./softwarectl3.rb package-list.txt

Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'tree' not installed!
Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'vim' not installed!
Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'gedit' not installed!
Se requieren privilegios de administrador (root) para ejecutar este comando.
[ERROR] Package 'nmap' not installed!
```


---
## 4. Añadiendo controles al proceso de instalación

Con el script anterior, me pasa mucho que me despisto, no inicio sesión como `root` y tengo que leer una lista enorme de mensajes de error. Así que vamos a controlar que hayamos iniciado sesión con el usuario `root` antes de hacer nada.

Creamos [softwarectl4.rb](example/software4.rb), donde añadimos el control de usuario "root":

```ruby
unless `whoami`.chop == 'root'
  puts "[ERROR] Run as \'root\' user!"
  exit 1
end
```

Se nos ocurre además, que podríamos dar un toque de "color" a los mensajes de nuestros scripts. Sobre todo para remarcar aquellas partes que deban destacarse y poner en rojo lo errores. Para esto vamos a instalar una librería o gema Ruby llamada "colorize".

* `sudo gem install colorize`, para instalar la gema (librería) colorize en nuestro sistema.

Veamos cómo usamos "colorize":

```ruby
#!/usr/bin/env ruby
require 'colorize'

##
# Check input arguments
if ARGV.empty?
  puts "Usage: #{$0} FILENAME"
  puts "       FILENAME is a text file with a list of package names."
  exit 1
end

##
# Check current user
unless `whoami`.chop == 'root'
  puts "[ERROR] Run as \'root\' user!".light_red
  exit 1
end
```

Explicación:
* Con `require 'colorize'` cargamos la librería (o gema) Rainbow.
* `puts "ERROR".light_red`, muestra el texto ERROR coloreado en rojo brillante.

Si quieres ver qué otras funciones o colores tiene Rainbow, lee [este enlace](https://github.com/fazibear/colorize).

Tenemos que:
1. El script muestra una ayuda cuando se ejecuta sin parámetros.
2. Muestra un error cuando no se ejecuta con el superusuario root.
3. Instala los paquetes del fichero que se pasa por parámetros.


instalar y desinstalar paquetes
system
zypper in
zypper remove
zypper se
apt

package-manager.rb
