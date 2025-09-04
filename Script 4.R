# Script 4
# 28/08/2025
# Javier Francisco Santos

# Importar datos
calidad <- read.csv("calidadplanta.csv", header = TRUE)
View(calidad)

# Asegurar que Tratamiento es un factor
calidad$Tratamiento <- as.factor(calidad$Tratamiento)
class(calidad)
summary(calidad)

# Medidas descriptivas
mean(calidad$IE)
tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

# Gráficos de caja
colores <- c("green", "red")

boxplot(calidad$IE ~ calidad$Tratamiento,
        col = colores,
        xlab = "Tratamiento aplicado",
        ylab = "Índice de Eficiencia (IE)",
        main = "Calidad de plantas")

boxplot(calidad$IE ~ calidad$Tratamiento,
        col = colores,
        xlab = "Tratamiento aplicado",
        ylab = "Índice de Eficiencia (IE)",
        ylim = c(0.4, 1.2),
        main = "Calidad de plantas")

# Subconjuntos por tratamiento
df_ctrl <- subset(calidad, Tratamiento == "ctrl")
df_fert <- subset(calidad, Tratamiento == "fert")  # Asegúrate de que "fert" sea el otro tratamiento correcto

# Crear los subconjuntos
df_ctrl <- subset(calidad, Tratamiento == "Ctrl")
df_fert <- subset(calidad, Tratamiento == "Fert")  # Asegúrate del nombre exacto

# QQ-plots para comprobar normalidad
par(mfrow = c(1, 2))

qqnorm(na.omit(df_ctrl$IE)); qqline(na.omit(df_ctrl$IE))
qqnorm(na.omit(df_fert$IE)); qqline(na.omit(df_fert$IE))

par(mfrow = c(1, 1))

# Prueba de normalidad
shapiro.test(df_ctrl$IE)
shapiro.test(df_fert$IE)

# Prueba de homogeneidad de varianzas
var.test(calidad$IE ~ calidad$Tratamiento)

# Prueba t de Student (dos colas)
t.test(calidad$IE ~ calidad$Tratamiento,
       alternative = "two.sided",
       var.equal = TRUE)

# Ejemplo erróneo (una cola: mayor)
t.test(calidad$IE ~ calidad$Tratamiento,
       alternative = "greater",
       var.equal = TRUE)

# Cálculo del tamaño del efecto de Cohen's d
cohens_efecto <- function(x, y) {
  n1 <- length(x); n2 <- length(y)
  s1 <- sd(x); s2 <- sd(y)
  sp <- sqrt(((n1 - 1) * s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
  (mean(x) - mean(y)) / sp
}

d1_cal <- cohens_efecto(df_ctrl$IE, df_fert$IE)
d1_cal


