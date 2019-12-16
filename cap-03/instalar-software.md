
# Instalar software

Cada vez que instalo el sistema operativo , suelo personalizarlo con los programas que uso habitualmente. Entonces vamos a crear un script para que nos ayude a personalizar la instalación del software de nuestro sistema.

Primero necesitamos definir la entrada de datos. Esta va a ser un fichero de texto que contenga la lista de todos los paquetes que queremos instalar. Ejemplo [software-list.txt](example/software-list.txt)

```
tree
vim
gedit
nmap
```

Ahora haremos un script [myinstall.rb](example/myinstall.rb) que lea el contenido del fichero. Separe cada línea para identificar el nombre de cada paquete y luego ejecute los comandos necesarios para instalar dicho paquete.


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

Debemos añadir
Comandos del sistema
help
whoami -> root
instalar y desinstalar paquetes
system
zypper in
zypper remove
zypper se
apt

package-manager.rb
