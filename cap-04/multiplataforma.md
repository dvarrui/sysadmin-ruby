
# Multiplataforma

Despues de acabar el script anterior para crear/eliminar usuarios en nuestro SO GNU/Linux se nos ocurre pensar...
* ¿Podría servir este script para otros sistemas operativos?
* En caso contrario ¿se podría adaptar de forma sencilla? o
* ¿Debemos crear otro script desde cero?

Vemos que el script tiene dos tipos de instrucciones:
* **Instrucciones escritas en Ruby** y que implementan la lógica del script (algoritmo de programación). Este algoritmo se encarga que resolver nuestro problema concreto. Esto es: Verificar argumentos de entrada, leer los datos de entrada desde fichero y procesar los datos (usuarios).
* **Comandos específicos del sistema operativo** que son los que finalmente interactúan con el sistema. En nuestro script son: `cat`, `useradd` y `userdel`.

Puesto que Ruby se puede instalar en cualquier plataforma, si queremos hacer una versión del script independiente del sistema operativo, podríamos resolver el problema sustituyendo todos los comandos específicos por instrucciones de Ruby.

## Sustitución de comandos específicos

Para la lectura del fichero de entrada habíamos usado el comando `cat` para ver el contenido, y luego `split` para separar las líneas. Ahora sustituiremos el comando por instrucciones propias de Ruby. Esto es, usando la instrucción `File.read(FILENAME)`.

Veamos un ejemplo de uso con `irb` (Interface interactiva):
* Leemos el contenido del archivo `list-users.txt`, y obtenemos un String `a` con todo el contenido del fichero de texto:
```
> irb
irb> a = File.read('list-users.txt')
=> "#Action:Username:Password:HomeFolder:Shell\ncreate:obiwan:123456:/home/obiwan:/bin/bash\ncreate:luke:::\ndelete:vader:::\n"

irb> a.class
=> String
```
* Descomponemos el String `a` en varias líneas, y obtenemos un Array `b`:
```
irb> b = a.split("\n")
=> ["#Action:Username:Password:HomeFolder:Shell", "create:obiwan:123456:/home/obiwan:/bin/bash", "create:luke:::", "delete:vader:::"]

irb> b.class
=> Array

irb> b.size
=> 4

irb> b[0]
=> "#Action:Username:Password:HomeFolder:Shell"

irb> b[1]
=> "create:obiwan:123456:/home/obiwan:/bin/bash"
```
* El Array `b` contiene 4 elementos, que son las 4 líneas del fichero de entrada `list-users.txt`, pero la primera línea no la necesitamos. Es una línea que empieza por `#` y no se debe tener en cuenta.
```
irb> b.delete_at(0)
=> "#Action:Username:Password:HomeFolder:Shell"

irb> b.size
=> 3

irb> b
=> ["create:obiwan:123456:/home/obiwan:/bin/bash", "create:luke:::", "delete:vader:::"]
```

Veamos ahora cómo lo integramos todo:

```ruby
  # Read input file => Array with file content
  lines = File.read(filename).split("\n")

  # Remove first line
  lines.delete_at(0)

  # Iterate "lines"
  lines.each do |line|
    ...
  end
```

* Primero leemos el contenido del fichero `File.read(filename)` y usando `split("\n")` separamos cada línea. Obtenemos como resultado un Array de líneas que guardamos en `lines`.

Tenemos el script modificado en [userctl4.rb](example/userctl4.rb).

---
## Detectar el sistema operativo

Todavía nos falta hacer que


(Comandos de windows)
salida en pantalla para un log..
help

lines = all_lines.select { |i| true unless(i.start_with?('#'))}
