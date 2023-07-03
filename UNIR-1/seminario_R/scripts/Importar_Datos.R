rm(list = ls())
# Importar archivos TXT ---------------------------------------------------


library(readr)
medidas_cuerpo <- read_delim("./Datos/medidas_cuerpo.txt", 
                               delim = "\t", escape_double = FALSE, 
                               comment = "#", trim_ws = TRUE
                             )
medidas_cuerpo <- read_delim("Datos/medidas_cuerpo.txt",
  delim = "\t", escape_double = FALSE,
  col_types = cols(sexo = col_factor(levels = c(
    "Mujer",
    "Hombre"
  ))), comment = "#", trim_ws = TRUE
)


library(readr)
imcenfant <- read_table("Datos/imcenfant.txt",
                        col_types = cols(SEXE = col_factor(levels = c("F","G")), 
                                         zep = col_factor(levels = c("O","N"))), 
                        skip = 12)


# Importar desde la web
url = "https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-24/gapminder_es.csv"
gapminder_es <- read_csv("https://raw.githubusercontent.com/cienciadedatos/datos-de-miercoles/master/datos/2019/2019-04-24/gapminder_es.csv")

horror_movies <- readr::read_csv('https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2022/2022-11-01/horror_movies.csv')


# https://www.lock5stat.com/datasets3e/NutritionStudy.xlsx
# https://www.lock5stat.com/datapage3e.html   # es la página

library(readxl)
url <- "https://www.lock5stat.com/datasets3e/NutritionStudy.xlsx"
destfile <- "NutritionStudy.xlsx"
curl::curl_download(url, destfile)
NutritionStudy <- read_excel(destfile)

class(NutritionStudy)

url <- "https://www.lock5stat.com/datasets3e/BodyTemp50.csv"
destfile <- "BodyTemp50.csv"
curl::curl_download(url, destfile)
# library(readr)
bodytemp <- read_csv(destfile)


# https://www.mapa.gob.es/es/alimentacion/temas/consumo-tendencias/2021datosanualesdelpaneldeconsumoalimentarioenhogaresv2_tcm30-623605.xlsx
direccion <- "https://www.mapa.gob.es/es/alimentacion/temas/consumo-tendencias/2021datosanualesdelpaneldeconsumoalimentarioenhogaresv2_tcm30-623605.xlsx"
destino <- "datos_consumo.xlsx"
curl::curl_download(direccion, destino)
datos_consumo <- read_excel(destino)
head(datos_consumo)
excel_sheets(destino)

datos_consumo_precio <- read_excel(destino, sheet = "PRECIO")
head(datos_consumo_precio)

datos_consumo_precio <- read_excel(
  destino,
  sheet = "PRECIO",
  skip = 2
)
head(datos_consumo_precio)


