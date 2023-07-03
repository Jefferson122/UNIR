
# Ejecutar código ---------------------------------------------------------
2 + 4  # Ctrl + Enter o clicamos en Run o Code ->  Run Selected Line(s)



# Guardar un script -------------------------------------------------------
# Inicialmente Untitle1 (Untitle2, etc...)

# Siempre que el nombre aparezca en rojo y con un asterisco, significa
# que hay cambios no guardados.

# Varias opciones:
# File -> Save/Save as 
# Ctrl + S  (esto es Save)
# ícono del disquete

# Abrir un script -------------------------------------------------------
# Varias opciones:
# File -> Open File
# Ctrl + O
# Utilizando la pestaña Files...
# ícono del disquete



# Instrucciones básicas ---------------------------------------------------

2+2
5*(3-1)^2
sqrt(4)


# creación de variables ---------------------------------------------------

# Asignación: son todos equivalentes
x <- rnorm(20)
y = seq(1, 10, by = 0.01)
seq(1, 10, by = 0.01) -> y2
y == y2



# Nombres de variables ----------------------------------------------------

# Podemos usar letras, números, puntos y guiones bajos 
# en el nombre de la variable, pero los guiones bajos y los números
# no pueden ser el primer carácter del nombre de la variable 
# y en caso de que el nombre empiece con un punto, a este no puede
# seguirle un número.

# También hay palabras reservadas que no se pueden usar 
# como identificadores, como TRUE, FALSE, NULL, Inf, entre otras. 
# La lista completa de palabras reservadas en R la puedes encontrar
# escribiendo help(Reserved) o ?Reserved en la consola de comandos.
help("Reserved")
# Si por alguna razón necesitas nombrar una variable con 
# una palabra reservada o comenzar con un guion bajo o número, 
# necesitarás usar acentos graves (backticks)

# Ejemplos de nombres válidos para variables en R 
suma_123 <- 1 + 2 + 3
Suma <- 1 + 2 + 3
suma <- 1 + 2 + 3
SumaTres <- 1 + 2 + 3
Sumatres <- 1 + 2 + 3
.suma_123 <- 1 + 2 + 3
true <- 1 + 2 + 3  # notar que la palabra reservada es TRUE, todas mayúsculas

# Ejemplos de nombres que no son válidos para variables en R 
_suma <- 1 + 2 + 3  # no puede comenzar con guión bajo 
suma$ <- 1 + 2 + 3 # no puede contener símbolos
suma@ <- 1 + 2 + 3
suma% <- 1 + 2 + 3

123suma <- 1 + 2 + 3  # no puede comenzar con números
.123suma <- 1 + 2 + 3  # si empieza con punto, no puede serguir un número
._123suma <- 1 + 2 + 3 # en cambio, esto sí funciona
TRUE <- 1 + 2 + 3
`TRUE` <- 1 + 2 + 3  # con los acentos graves funciona bien



# Comentarios -------------------------------------------------------------


# Cualquier línea que comience con el símbolo # R lo interpreta
# como un comentario y, por lo tanto, no lo ejecuta.
# 2 + 3

# visualizar --------------------------------------------------------------


# ¿Cómo visualizamos en consola los valores asignados a una variable?
x <- rnorm(20)

x

# También podemos utilizar parentesis para asinar y mostrar al mismo tiempo
(w <- 2*4)



# Operaciones básicas -----------------------------------------------------

s <- 3

(w + s)
(w - s)
(w * s)
(w / s)
(w %/% s)
(w %% s)   # 8 = 3 * 2 + 2
w^s

# raiz cuadrada (y solo cuadrada!)
sqrt(w)

# ¿otros índices para radicación? Recordando que la raíz
# n-ésima de m es m elevado a la potencia 1/n
w^(1/3)  # raíz cúbica
# Ojo con los paréntesis
w^1/3  # esto hace (w^1)/3, es decir 8/3...

# otras funciones
help(Math)
abs(-2)
sign(-2)
round(2.456, 2)
"+"(1,2)
tan(pi/4)
cos(pi)
sin(pi)  #0???
tan(pi/2) # infinito??

# La ayuda de R
help(mean)
?mean

# ayuda sobre un paquete 
help(package = 'dplyr')
