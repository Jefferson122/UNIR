
# ¿Por qué crear funciones? -----------------------------------------------

df <- data.frame(
  a = rnorm(10),
  b = rnorm(10, mean = 0, sd = 2),
  c = rnorm(10, mean = 0, sd = 0.5),
  d = rnorm(10, mean = -1, sd = 1)
)


# queremos estandarizar los datos, esto es, 
# queremos que cada columna tenga media 0 y varianza 1. 
# Para lograr esto necesitamos transformar cada columna restándole su media 
# y dividiéndola por su desviación típica. Esto es,
df$a.new <- (df$a - mean(df$a)) / sd(df$a)
df$b.new <- (df$b - mean(df$b)) / sd(df$b)
df$c.new <- (df$c - mean(df$c)) / sd(df$c)
df$d.new <- (df$d - mean(df$d)) / sd(df$d)

# Chequeamos
df
colMeans(df)

# Deberíamos hacerlo usando una función que no se equivoque!
mi_estad <- function(col){
  media = mean(col)
  desvio = sd(col)
  new_col = (col-media)/desvio
}

mi_estad(rnorm(10, mean = 0, sd = 2))

df <- data.frame(
  a = rnorm(10),
  b = rnorm(10, mean = 0, sd = 2),
  c = rnorm(10, mean = 0, sd = 0.5),
  d = rnorm(10, mean = -1, sd = 1)
)

df2 <- apply(df, 2, mi_estad)
colMeans(df2)
apply(df2, 2, sd)


# estructura basica
# nombre <- function(argumentos) {
#   cuerpo
# }


# la función return
mi_descr <- function(datos) {
  if (!is.numeric(datos)) {
    return('datos debe ser numérico')
  }
  med <- mean(datos)
  des <- sd(datos)
  mini <- min(datos)
  maxi <- max(datos)
  n <- length(datos)
  return(list(
    media = med, 
    desvio = des,
    minimo = mini,
    maximo = maxi,
    n = n
  ))
}

set.seed(78)
x <- runif(50, 0, 1)
res <- mi_descr(x)
res
# quiero la media?
res$media

x <- c(x, 'hola')
res <- mi_descr(x)
names(res)


#Creamos una función para obtener la tabla de frecuencias 
tabla_frec <- function(x){
  grupos <- factor(x)
  grupos <- levels(grupos)
  f.abs <- as.vector(table(x))
  f.rel <- round(f.abs/length(x), 2)
  f.abs.acum <- cumsum(f.abs)
  f.rel.acum <- round(cumsum(f.rel), 2)
  tabla_x <- data.frame(grupos,f.abs,f.rel,f.abs.acum,f.rel.acum)
  tabla_x
}
library(MindOnStats)
data('PennState2')
attach(PennState2)
tabla_frec(Friends)

dor <- c(3, 1, 2, 1, 2, 1, 2, 4, 1, 3, 5, 2, 2, 5, 4, 4, 4, 5, 1, 2)
tabla_frec(dor)




# Variable locales y globales ---------------------------------------------
# Queremos definir una función que, dado un vector numérico,
# nos devuelva su longitud, la suma de todos los valores y un vector
# con las sumas acumuladas.
f <- function(v) {
  n <- length(v)
  acum <- rep(NA, n)
  s <- 0
  for(i in seq_along(v)) {
    s <- s + v[i]
    acum[i] <- s
  }
  return(list(
    suma = s, 
    acumuladas = acum,
    n = n
  ))
}
# probamos nuestra función
v <- c(0.25, 0.15, 0.10, 0.35, 0.10, 0.05)
f(v)


# las variables n, acum y s son variables locales
# Las variables locales, junto con los parámetros formales, 
# se crean al ejecutarse la función y normalmente desaparecen al terminar 
# su ejecución.

n = 4
res <- f(v)
n
res$n
acum

# variables globales
s <- 0
g <- function(v) {
  for(i in seq_along(v)) {
    s <- s + v[i]
  }
  s
}
v <- c(0.25, 0.15, 0.10, 0.35, 0.10, 0.05)
g(v)
s


# Argumentos predeterminados
maximo2 <- function(a, b = 0) {
  if (a > b) {
    m <- a
  } else {
    m <- b
  }
  m
}

maximo2(1)
maximo2(1,0)
maximo2(0,1)

maximo2(a = 1)
maximo2(b = 1)



