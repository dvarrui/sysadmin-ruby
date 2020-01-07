
# Multiplataforma

Despues de acabar el script anterior para crear/eliminar usuarios en nuestro SO GNU/Linux se nos ocurre pensar...
* ¿Podría servir este script para otros sistemas operativos?
* En caso contrario ¿se podría adaptar de forma sencilla? o
* ¿Debemos crear otro script desde cero?

Vemos que el script tiene dos tipos de instrucciones:
* **Instrucciones escritas en Ruby** y que implementan la lógica del script (algoritmo de programación). Este algoritmo se encarga que resolver nuestro problema concreto. Esto es: Verificar argumentos de entrada, leer los datos de entrada desde fichero y procesar los datos (usuarios).
* **Comandos específicos del sistema operativo** que son los que finalmente interactúan con el sistema. En nuestro script son: `cat`, `useradd` y `userdel`.

Puesto que Ruby se puede instalar en cualquier plataforma, si queremos hacer una versión del script independiente del sistema operativo, podríamos resolver el problema sustituyendo todos los comandos específicos por instrucciones de Ruby.

---
## Sustitución de comandos específicos

Para la lectura del fichero de entrada habíamos usado el comando `cat` para ver el contenido, y luego `split` para separar las líneas. Ahora sustituiremos el comando por instrucciones propias de Ruby. Esto es `File.read(FILENAME)`. Veamos:

```ruby
  # Read input file => Array with file content
  all_lines = File.read(filename).split("\n")

  # Select lines without '#' symbol
  lines = all_lines.select do |i|
    if i.start_with?('#')
      false
    else
      true
    end
  end

  lines.each do |line|
    ...
  end
```

* Primero leemos el contenido del fichero `File.read(filename)` y usando `split("\n")` separamos cada línea. Obtenemos como resultado un Array de líneas que guardamos en `all_lines`.
* Segundo vamos a filtrar el array `all_lines` para quedarnos sólo con las líneas que NO comienzan por `#`. Esto es `lines = all_lines.select do |i| ... end`. jajaja Parece un jeroglífico... pero vamos a explicarlo:
    * `lines = ...`, variable que guardará un Array con los elementos seleccionadas del Array `all_lines`.
    * `all_lines.select do |i| ... end`, iteramos sobre los elementos del Array `all_lines` y se seleccionan los que cumplan el criterio de selección. `select` es un método del objeto Array `all_lines` que acepta como argumento un bloque de código (`do ... end`), el cuál establece el criterio de selección.
    * `do |i| ... end`, este es el criterio se selección. Es un bloque de código que devuelve `true` si se debe escoger el elemento o `false` en caso contrario.

Ahora que le hemos explicado un poco mejor y se ha entendido(eso espero), vamos a cambiar el código para escribirlo de forma más compacta y "fácil" de leer para un "rubista".

```ruby
lines = all_lines.select { |i| true unless i.start_with?('#') }
```

Explicaciones:
* El método `select` acepta un bloque de código (`{ ... }`) que establece el criterio de selección de los elementos del Array.
* `true unless i.start_with?("#")`, si `i` (String) no empieza por "#", entonces se retorna el valor `true`. Esto es, si `i` no empieza por `#` entonces se selecciona.

Tenemos el script modificado en [userctl4.rb](example/userctl4.rb).

---
## Detectar el sistema operativo

Todavía nos falta hacer que


(Comandos de windows)
salida en pantalla para un log..
help

lines = all_lines.select { |i| true unless(i.start_with?('#'))}
