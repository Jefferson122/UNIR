
# Objetos atómicos --------------------------------------------------------

# Esencialmente trabajeremos con 4 tipos elementales
# numeric
# integer
# charcter
# logical

# coerción 
# La coerción de tipos se realiza de los tipos de datos 
# más restrictivos a los más flexibles, esto es, 
# en el siguiente orden: 
# logical -> integer -> numeric -> character. 
# Las coerciones no pueden ocurrir en orden inverso. 
# Podemos coercionar un dato de tipo entero a uno numérico, 
# pero no uno de cadena de texto a numérico.

# Vectores ----------------------------------------------------------------
# Lista de objetos del mismo tipo atómico

# Usando la función c() (combinar o concatenar)
v1 <- c(1, 2, 3, 5, 8, 9)
typeof(v1)
class(v1)

v11 <- c(1L, 2L, 3L, 5L, 8L, 9L)
typeof(v11)
class(v11)
# La "L" después de cada número le dice a R que quieres que 
# sea un número entero.


v12 <- c(1, 1L)
class(v12)
typeof(v12)



v2 <- c('lunes', 'tres', '2')
typeof(v2)
class(v2)

v3 <- c('lunes', 'tres', 2)
v3
typeof(v3)
class(v3)



# Creando sucesiones de números: operador : y funciones seq() y rep()

#####################
# Operador :  (incrementos de una unidad)
#####################

1:10 # creciente
12:5 # decreciente
-5:7 # con indices negativos
2.3:-7.1  # también índices no enteros

#######################
# La función seq()  
######################
# Sequencia de 2 a 8 con pasos de 2
seq(from = 2, to = 8, by = 2)  
## [1] 2 4 6 8

# Sequencia de longitud 9 desde 2 hasta 8
seq(from = 2, to = 8, length.out = 9)
## [1] 2.00 2.75 3.50 4.25 5.00 5.75 6.50 7.25 8.00

#####################
# La función rep()
#####################
# repertor el 1 5 veces
rep(1, 5)  
# [1] 1 1 1 1 1

# también otros tipos de datos
rep(TRUE, 3)
## [1] TRUE TRUE TRUE
rep('hola',2)
## [1] "hola" "hola"

# repetir la secuencia 7, 2 tres veces
rep(c(7,2), 3)  # explicitamente rep(c(1,2),times=3)
## [1] 7 2 7 2 7 2

# repetir 7 tres veces y luego el 2 tres veces
rep(c(7,2), each = 3)
## [1] 7 7 7 2 2 2

# también nos puede interesar repetir un número distinto de veces 
# cada elemento
rep(c(7,2), times = c(2,3)) # dos veces el 7 y tres veces el 2
## [1] 7 7 2 2 2

# podemos también indicar la longitud que queremos
rep(1:4, each = 2, length.out = 5)  # devuelve los primeros 5 elementos de rep(1:4, each = 2)
## [1] 1 1 2 2 3

rep(1:4, each = 2, length.out = 11) # los 8 elementos de rep(1:4, each = 2) y completa hasta obtener 11 elementos recomenzando el ciclo
## [1] 1 1 2 2 3 3 4 4 1 1 2



# sucesiones aleatorias ---------------------------------------------------

s1 <- rnorm(n = 20, mean = 1, sd = 1)
s2 <- runif(n = 20, min = 1, max = 10)


# Contar la cantidad de elementos de un vector
length(s1)

# extraer subconjuntos de un vector
s1[1:5]  # extrae los primeros 5 elementos
s1[c(1, 3, 7)]
s2[s2>5]



# Matrices ----------------------------------------------------------------

# Crear matrices
# función matrix()
M1 <- matrix(1:15, nrow = 3, byrow = TRUE)
M1

#dimensiones de la matriz
dim(M1)

# funciones cbind() y rbind()
M2 <- cbind(s1, s2)
dim(M2)
M3 <- rbind(s1, s2)
dim(M3)

# añadiendo el atributo dim a un vector
M4 <- 1:20
M4
class(M4)
dim(M4) <- c(4,5)
M4
class(M4)

# nombrar filas y/o columnas
rownames(M4) <- letters[1:4]
colnames(M4) <- LETTERS[1:5]
M4

colnames(M4) <- c('lun', 'mar', 'mier', 'jue', 'vier')
M4

# Seleccionar subconjuntos e una matriz
# Debemos indicar que filas y que columnas queremos
M1[1, 3:5]
M1[1:2, 3:5]
M1[, c(1, 3, 5)]

M4[c('a','b'),]
M4[,c('mar','vier')]


# Operaciones
M5 <- matrix(1:6, nrow = 3, byrow = TRUE)
M6 <- matrix(1:6, nrow = 3)
M6 + M5
M6 - M5
M6 * M5
M6 %*% M5 # no son conformables
dim(M6)  # 3 x 2
dim(M5)  # 3 x 2
t(M6) %*% M5 # ahora si

M5 * 2
M5 - 2

# inversa
M7 <- 1:4
dim(M7) <- c(2,2)
solve(M7)

det(M7)
diag(M2)  # la diagonal principal
sum(diag(M7))  # la traza



# Data frames -------------------------------------------------------------

# Conjunto de vectores columnas: mismo tipo en columnas, distinto tipo en filas
# es la estructura natural para almacenar dataset

# La instalación básica de R lleva predefinidos algunos conjuntos de datos. Podemos visualizarlos ejecutando la instrucción data()
data()
data('ChickWeight')
head(ChickWeight)
dim(ChickWeight)
class(ChickWeight)
# en cambio
typeof(ChickWeight)


# creamos data frames con la función data.frame
altura <- c(167, 192, 173, 174, 172, 167, 171, 185, 163, 170) # en cm
peso <- c(86, 74, 83, 50, 78, 66, 66, 51, 50, 55) # en Kg
fuma <- c("No", "Si", "No", "Si", "No", "No", "Si", "Si", "Si", "No") # habito de fumador
sexo <- c("M", "M", "F", "M", "M", "M", "F", "M", "F", "F")

df <- data.frame(altura, peso, habito = fuma, sexo, 1:10)
df



# ¿Como accedemos a las variables? Por ejemplo, a la variable altura
df$altura
df[1]
df[,1]
# diferencias?
class(df$altura)
class(df[1])
class(df[,1])

df[,1, drop = FALSE]
class(df[,1, drop = FALSE])
# Para conservar la dimensionalidad original, 
# debe utilizar el argumento drop = FALSE.

# acceso a las variables utilizando attach()
altura
attach(df)
altura
detach(df)
altura

