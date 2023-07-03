# condicionales: un tipo que permite la ejecución condicional de bloques de código, 
#	iterativas: permiten la repetición de un bloque de instrucciones, 
#             un número determinado de veces o mientras se cumpla una condición.



# condicionales -----------------------------------------------------------

# if
num <- -2   # asignamos a num el valor -2
if (num < 0) {  
  num <- -num
}
num
num <- 3


# if... else
# redondear al entero más cercano
a <- 5.67  # comenzamos con un decimal (el que vamos a redondear)
a_ent <- trunc(a) # la parte entera de a
dec <- a - a_ent   # la parte decimal
if (dec >= 0.5) {
  a <- a_ent + 1
} else {
  a <- a_ent 
}
a


# dos o más condiciones
a <- 1
b <- -2
if (a > b) {
  print("a gana!")
} else if (a < b) {
  print("b gana!")
} else {
  print("Esto es un empate :(")
}


# La sentencia ifelse()
# Permite vectorizar el if
x <- 1:10  # vector de enteros
if (x %% 2 == 0) {
  "Es par"
} else {
  "Es impar"
}

ifelse(x %% 2 == 0, 'Es par', 'Es impar')



# Iterativas --------------------------------------------------------------

# Sentencia for
for(i in 1:3) {
  print(2 * i)
}

N <- 100
suma <- rep(NA, N) 
for(i in 1:N){
  dado1 <- sample(1:6, size = 1)
  dado2 <- sample(1:6, size = 2)
  suma[i] <- dado1 + dado2
}

suma[1:10]
mean(suma)
table(suma)


# Sentencia while
set.seed(1)
dado <- sample (1:6, 1)  # tiramos una vez el dado
dado
# y repetimos hasta obtener el 6
dado <- sample (1:6, 1)  # segunda, 4
dado

dado <- sample (1:6, 1)  # tercera, 1
dado

dado <- sample (1:6, 1)  # cuarta, 2
dado

dado <- sample (1:6, 1)  # quinta, 5
dado

dado <- sample (1:6, 1)  # sexta, 3
dado

dado <- sample (1:6, 1)  # septima, 6!!!
dado

# uffff... algo más astuto???

set.seed(1)
dado <- sample (1:6, 1)  # tiramos una vez el dado
tiradas <- dado     # acá vamos a guardar los resultados que van saliendo
while (dado != 6) {
  dado <- sample(1:6, 1)  # vuelvo a tirar el dado
  tiradas <- c(tiradas, dado)  # agregamos el valor obtenido
}
dado  # salió del lazo cuando obtuvimos el 6
tiradas



# break y next
# break nos permite interrumpir un bucle, 
# next nos deja avanzar a la siguiente iteración del bucle, “saltándose” la actual. Veamos algunos 

for (i in 1:10) {
  if (i %% 2 != 0)  # esto saltea los impares
    next
  
  print(i)
  
  if (i >= 8)       # esto finaliza el bucle
    break
}
