
# Entrada desde fichero (offline)

Como dijimos los Array y los String nos van a ser muy útiles para nuestros scripts. En el ejemplo [greet6.rb](example/greet6.rb) pudimos usar los argumentos para hacer una entrada "masiva" de datos al script. ¡Bueno, no tan "masiva"! Si tuviéramos que saludar a cientos de personas... ¡uf!

Otro enfoque será el siguiente. Vamos a escribir todos los nombres de todas las personas a las que queremos saludar en un fichero de texto. Luego el script que lea el archivo, identifique los nombres y los salude todos. Vamos allá.

Contenido de `characters.txt`
```
Obi-wan Kenobi
Qui-gon Jinn
Yoda
```

Expliquemos lo nuevo del script [greet7.rb](example/greet7.rb):
```ruby
filename = ARGV.first
names = File.readlines(filename)

names.each do |name|
  puts "Hello #{name.chop}!"
end
```

Combinar && y ||


Hasta ahora no hemos resuelto ningún problema interesante para un administrador de sistemas. Sólo hemos saludado de muchas maneras diferentes. En los próximos capítulos vamos a aplicar lo que hemos aprendido para empezar a resolver problemas más reales.
