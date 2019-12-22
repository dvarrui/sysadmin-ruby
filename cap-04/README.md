
# Crear usuarios

Vamos a cambiar de tarea. Ahora vamos a tratar de crear usuarios de forma masiva. Aprovecharemos lo que hemos visto en el capítulo anterior.

## Crear script userctl

Creamos nuestra primera versión del script [userctl.rb](example/userctl.rb) basándonos en "softwarectl5.rb", pero cambiando lo siguiente el método "install_packages" por este otro "create_users":

```ruby
def create_users(filename)
  # Check current user
  unless %x[whoami].chop == 'root'
    puts "[ERROR] Run as \'root\' user!".light_red
    exit 1
  end
  # Read input file
  users = %x[cat #{filename}].split("\n")
  # Create users
  users.each do |name|
    # * Create user 'name'
    # * Create home folder as '/home/name'
    # * Set user password to '123456'
    ok = system("useradd #{name} -m -p 123456")
    unless ok
      puts "[ERROR] User '#{name}' not created!".light_red
    end
  end
end

check_arguments
create_users(ARGV.first)
```

También creamos otro fichero de entrada ([users-list.txt](example/users-list.txt)) con los nombres de los usuarios:

```
obiwan
luke
yoda
```

Realmente es casi lo mismo que teníamos antes, sólo que:
1. En lugar de nombres de paquetes tenemos nombres de usuarios.
2. Ahora invocamos el comando `useradd USERNAME -m -p 123456` para crear usuario con su directorio HOME y la clave igual a 123456.

---
## Crear y eliminar usuarios

Vamos a ampliar un poco más el script y vamos a crear otra versión donde incluiremos las opciones "crear" y "eliminar" usuarios.

Script [userctl2.rb](example/userctl2.rb):

Crear usuarios del sistema
Leyéndolos de un fichero
cat, split
adduser deluser

instalar y desinstalar paquetes
zypper se
apt

(Comandos de windows)
salida en pantalla para un log..
help
