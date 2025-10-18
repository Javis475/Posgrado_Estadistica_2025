#Laboratorio semana H2

data("iris")
boxplot(iris$Sepal.Length ~ iris$Species)

dat_iris <-subset(iris, Species %in% c("versicolor", "virginica"))
install.packages("ggplot2")
# Cargar base de datos
data(iris)

# Primeros registros
head(iris)

# Estadísticas generales
summary(iris)
# Filtrar solo las especies setosa y versicolor
iris_sub <- subset(iris, Species %in% c("setosa", "versicolor"))

# Estadísticas descriptivas de Petal.Length por especie
aggregate(Petal.Length ~ Species, data = iris_sub, summary)
# Ho (hipótesis nula): No hay diferencia en las medias de Petal.Length entre setosa y versicolor

# H1 (hipótesis alternativa): Sí hay diferencia en las medias
# Verificación de homogeneidad de varianzas
var.test(Petal.Length ~ Species, data = iris_sub)
# Prueba t
t.test(Petal.Length ~ Species, data = iris_sub, var.equal = FALSE)  # Welch
# Instalar y cargar el paquete
install.packages("effsize")
library(effsize)

# Subconjunto con solo dos especies
iris_sub <- subset(iris, Species %in% c("setosa", "versicolor"))

# Aplicar cohen.d()
iris_sub$Species <- droplevels(iris_sub$Species)
cohen.d(Petal.Length ~ Species, data = iris_sub)
library(ggplot2)

ggplot(iris_sub, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin(trim = FALSE, alpha = 0.7) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(title = "Comparación de la Longitud del Pétalo entre Especies",
       x = "Especie", y = "Longitud del Pétalo") +
  theme_minimal()

options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("ggplot2")
library(ggplot2)
# Cargar datos
data("iris")

# Filtrar solo las especies setosa y versicolor
iris_sub <- subset(iris, Species %in% c("setosa", "versicolor"))
iris_sub$Species <- droplevels(iris_sub$Species)

# Estadísticas descriptivas
aggregate(Petal.Length ~ Species, data = iris_sub, summary)

# Prueba de homogeneidad de varianzas
var.test(Petal.Length ~ Species, data = iris_sub)

# Prueba t de Welch
t.test(Petal.Length ~ Species, data = iris_sub, var.equal = FALSE)

# Instalar paquetes FUERA de este script (solo una vez)
# install.packages("effsize")
# install.packages("ggplot2")

# Cargar librerías
library(effsize)
library(ggplot2)

# Calcular Cohen's d
cohen.d(Petal.Length ~ Species, data = iris_sub)

# Guardar gráfico en PDF
pdf("grafico_iris.pdf", width = 7, height = 5)

p <- ggplot(iris_sub, aes(x = Species, y = Petal.Length, fill = Species)) +
  geom_violin(trim = FALSE, alpha = 0.7) +
  geom_boxplot(width = 0.1, fill = "white") +
  labs(title = "Comparación de la Longitud del Pétalo entre Especies",
       x = "Especie", y = "Longitud del Pétalo") +
  theme_minimal()











