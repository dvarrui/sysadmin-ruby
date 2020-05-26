
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

También creamos otro fichero de entrada ([list-names.txt](example/list-names.txt)) con los nombres de los usuarios:

```
obiwan
luke
yoda
```

Realmente, es casi lo mismo que teníamos antes, sólo que:
1. En lugar de nombres de paquetes tenemos nombres de usuarios.
2. Ahora invocamos el comando `useradd USERNAME -m -p 123456` para crear usuario con su directorio HOME, y por el momento, la clave la pondremos como 123456.

## Crear y eliminar usuarios

Vamos a ampliar un poco más el script, y vamos a crear otra versión donde incluiremos las acciones para "crear" y "eliminar" usuarios.

El script [userctl2.rb](example/userctl2.rb) tiene las siguientes funciones/métodos principales:

* **check_arguments**: Verifica que los argumentos de entrada son correctos, y si se indica un FILENAME, se comprueba que exista.
* **create_users**: Crea los usuarios definidos en FILENAME.
* **delete_users**: Elimina los usuarios definidos en FILENAME.

Quería hacer notar, que se ha eliminado el código que verificaba que el usuario que está ejecutando el script era obligatoriamente `root`. Es cierto, que para ejecutar correctamente el script vamos a necesitar privilegios, pero no es obligatorio que seamos `root`. También podemos invocar el script con `sudo usertctl2.rb FILENAME`. Lo importante es tener los privilegios suficientes.

## Más información en FILENAME

En el ejemplo anterior, cuando se creaba un usuario nuevo, sólo se inficaba el nombre del mismo, pero no se especificaban otros datos como password, directorio home, shell, etc. Así que vamos a ampliar estos datos dentro del fichero [list-users.txt](example/list-users.txt), de la siguiente forma:

```
#Action:Username:Password:HomeFolder:Shell
create:obiwan:123456:/home/obiwan:/bin/bash
create:luke:::
delete:vader:::
```

El fichero tiene una cabecera que nos indica el significado de los distintos campos separados por `:`. Ahora todas las líneas que comiencen por `#` serán ignoradas en la entrada de datos.

El fichero de entrada contiene los campos que se indican separados por comas. En el caso de que los campos estén vacíos, se usarán valores por defecto.

> Las aplicaciones las podemos configurar para que se comporten según nuestras necesidades, pero si elegimos el camino estándar (La convención) entonces es más fácil porque se configura por defecto.
> Esto en Ruby se llama "Convención frente a configuración".

Para ejecutar nuestro nuevo script [userctl3.rb](example/userctl3.rb) hacemos: `./userctl3.rb list-users.txt`.

Ahora tenemos las siguientes funciones:
* **check_arguments**: para comprobar que los argumentos de entrada son correctos.
* **read_input_data**: Se encarga de leer el fichero de entrada y descomponer cada fila en los campos correspondientes para crear una lista (Array) de Hashes.
* **process_users**: Lee la lista de los usuarios y los procesa uno a uno.
* **create_user**: Crea un usuario determinado.
* **delete_user**: Elimina un usuario determinado.

[next >>](multiplataforma.md)
