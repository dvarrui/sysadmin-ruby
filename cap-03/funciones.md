[<< back](README.md)

# Funciones

Cuando el código dentro del script va creciendo, se hace necesario buscar formas de trabajar o estrategias que nos ayuden a mantenerlo todo ordenado y bien organizado. Por ejemplo podemos usar las **funciones** (y también los métodos) que nos permiten asignar un nombre a un bloque de código.

## Ejemplo sin funciones

Veamos este ejemplo:

```ruby
# Ensure we are superuser
if %x[whoami].chop != 'root'
  puts "Sorry, you must be root!"
  exit 1
end

# Do your task
puts "Hello! I'm root!"
puts "I'm working too hard"
```

Este bloque de código tiene la función de:
1. Asegurarse de que somos el usuario `root`. En caso contrario se termina el programa con error.
2. Realizar una serie de tareas muy importantes.

## Empecemos a usar funciones

Las funciones empiezan por `def` y terminan por `end`. En medio se coloca un bloque de código. Además a la función de le da un nombre. A ser posible un verbo que indique la acción que realiza el bloque de código que contiene.

Veamos como creamos las funciones con `def-end`:

```ruby
def ensure_you_are_superuser
  # Ensure we are superuser
  if %x[whoami].chop != 'root'
    puts "Sorry, you must be root!"
    exit 1
  end
end

def do_tasks
  # Do your tasks
  puts "Hello! I'm root!"
  puts "I'm working too hard"
end
```

Una vez definidas las funciones, ya las podemos usar. Simplemente invocando el nombre de la función como si fuera un comando o instrucción nueva del lenguaje.

```ruby
# Main block
ensure_you_are_superuser
do_tasks
```

Leyendo este bloque main... nos queda más claro el objetivo del script:
1. Ensure you are superuser
2. Do tasks

A partir de ahora, intentaremos:
1. Crear funciones para hacer el código más legible.
2. Introducir comentarios.

[next >>](instalar-software.md)
