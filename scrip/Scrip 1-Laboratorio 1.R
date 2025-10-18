#Javier Francisco Santos
300+240+1527+400+1500+1833
celular <- 300
celular
transporte <- 240
comestibles <- 1527
gimnasio <- 400
alquiler <- 1500
otros <- 1833
abs(10)
abs(-4)
sqrt(9)
log(2)
#este es un comentario

4+5 #tambien se puede coloacar un comentario

celular <- 300
Celular <- 300
CELULAR <- 8000
celular+Celular+CELULAR
CELULAR-celular


help(abs)
help(mean)
?mean
?abs
help.search("absolute")
gastos <- c(celular, transporte, comestibles, gimnasio, alquiler, otros)
gastos
barplot(gastos)
sort(gastos)
gastosordenados <- sort(gastos)
barplot(gastosordenados)
help(sort)
sort(gastos, decreasing = TRUE)
gastoordenado <- sort(gastos, decreasing = TRUE)
barplot(gastoordenado)     
help(barplot)
names(gastoordenado) <- c("otros", "comestibles", "alquiler", "gimnasio", "celular", "transporte")
barplot(gastoordenado, 
        main = "Gastos mensuales",
        names.arg = names(gastoordenado),
        col = "red")
#parte dos variables
#problema 1 identifique el tipo de variable (cualitativa o cuantitativa) segun la lista
variables <- c(
  nombre_de_estudiante = "Cualitativa",
  fecha_de_nacimiento = "Cualitativa",
  edad = "Cuantitativa",
  direccion_de_casa = "Cualitativa",
  numero_de_telefono = "Cualitativa",
  area_principal_de_estudio = "Cualitativa",
  grado_universitario = "Cualitativa",
  puntaje_en_la_prueba = "Cuantitativa",
  calificacion_general = "Cualitativa",
  tiempo_para_completar_la_prueba_de_MCF202 = "Cuantitativa",
  numero_de_hermanos = "Cuantitativa"
)
# problema 2 objeto planta 14 variables
# Variables Cuantitativas
variables_cuantitativas <- c(
  "Altura",
  "DAP",
  "Número de ramas",
  "biomasa",
  "cobertura",
  "Contenido de clorofila",
  "Tasa de crecimiento"
)
# Variables Categóricas (Cualitativas)
variables_categoricas <- c(
  "Especie",
  "color de las flor",
  "tipo de hoja",
  "tipo de frutos",
  "tipo de raíz",
  "estado de salus",
  "forma de crecimiento"
)
# problema 3
# las variables son cualitativas ya que los numeros no representan una cantidad
# Problema 4
# ¿Cuál es la cantidad promedio de horas que los estudiantes de universidades públicas trabajan cada semana?

individuos_p1 <- "Estudiantes"
variable_p1 <- "Horas trabajadas"
tipo_variable_p1 <- "Cuantitativa"

# -------------------------------
# Pregunta 2
# ¿Qué proporción de todos los estudiantes universitarios de México están inscritos en una universidad pública?

individuos_p2 <- "Estudiantes"
variable_p2 <- "Tipo de universidad"
tipo_variable_p2 <- "Categórico"

# -------------------------------
# Pregunta 3
# En las universidades públicas, ¿las estudiantes femeninas tienen un promedio de CENEVAL más alto que los estudiantes varones?

individuos_p3 <- "Estudiantes"
variable1_p3 <- "Sexo"
tipo_variable1_p3 <- "Categórico"
variable2_p3 <- "Puntaje CENEVAL"
tipo_variable2_p3 <- "Cuantitativa"

# -------------------------------
# Pregunta 4
# ¿Es más probable que los atletas universitarios reciban asesoramiento académico que los atletas no universitarios?

individuos_p4 <- "Atletas"
variable1_p4 <- "Tipo de atleta"
tipo_variable1_p4 <- "Categórica"
variable2_p4 <- "asesoramiento académico"
tipo_variable2_p4 <- "Categórica"

# -------------------------------
# Pregunta 5
# ¿Qué datos podrían analizarse mediante un histograma?

# Variables adecuadas para histograma:
# - Horas trabajadas por semana
# - Puntaje ceneval
options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("tinytex")
tinytex::install_tinytex(force = TRUE)
tinytex::is_tinytex()


