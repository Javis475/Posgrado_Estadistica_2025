#Laboratorio 2: Empezar con R y Rstudio
# Semana 2


# Laboratorio 2-Parte 1 ---------------------------------------------------

# Importar datos web

read.csv("https://repodatos.atdt.gob.mx/api_update/senasica/actividades_\
         inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv")

url <- paste0("https://repodatos.atdt.gob.mx/api_update/senasica/",
              "actividades_inspeccion_movilizacion/29_actividades-inspeccion-movilizacion.csv")
browseURL(url)
senasica <- read.csv(url, header = T)

View(senasica)

url2 <- ("https://repodatos.atdt.gob.mx/api_update/senasica/actividades\inspeccion_movilizacion29_actividades-inspeccion\-movilizacion.csv")
browseURL(url)
senasica <- read.csv(url, header = T)
senasica2 <- read.csv(url2, header = T)
head(senasica2[, c(1,3:12)])

