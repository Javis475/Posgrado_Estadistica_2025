# scrip 4
# 28/08/2025
# Javier Francisco Santos

#importar 
calidad <- read.csv ("calidadplanta.csv" , header = T)
View(calidad)
calidad$Tratamiento <- as.factor(calidad$Tratamiento)
class(calidad)
summary(calidad)

mean(calidad$IE)

tapply(calidad$IE, calidad$Tratamiento, mean)
tapply(calidad$IE, calidad$Tratamiento, sd)
tapply(calidad$IE, calidad$Tratamiento, var)

colores <- c("green", "red")

boxplot(calidad$IE~ calidad$Tratamiento, col = colores)
boxplot(calidad$IE ~ calidad$Tratamiento,
        col = colores,
        xlab = "Tratamiento aplicado",              # Eje X
        ylab = "Índice de Eficiencia (IE)",         # Eje Y
        main = "Calidad de plantas")  # Título del gráfico
boxplot(calidad$IE ~ calidad$Tratamiento,
        col = colores,
        xlab = "Tratamiento aplicado",              # Eje X
        ylab = "Índice de Eficiencia (IE)",         # Eje Y
        ylim = c(0.4, 1.2),                         # Límites del eje Y
        main = "Calidad de plantas") 
# aplicar un subconjunto para cada tratamiento
df_ctrl <- subset(calidad, Tratamiento == "ctrl"
                  df_fert <- subset(calidad, Tratamiento = "ctrl"
                                    par(mfrow=c(1,2))
                                    qqnorm(df_ctrl$IE); qqline(df_ctrl$IE)
                                    qqnorm(df_fert$IE); qqline(df_fert$IE)
                                    par(mfrow=c(1,2))
                                    
                                    
                                    # Comprobando los 3 supuestos ---------------------------------------------
                                    
                                    
                                    shapiro.test(df_ctrl$IE) # Normales
                                    shapiro.test(df_fert$IE) # Normales
                                    
                                    var.test(calidad$IE ~ calidad$Tratamiento)
                                    
                                    t.test(calidad$IE ~ calidad$Tratamiento, alternative = "two.sided", var.equal = T)
                                    
                                    # Ejemplo erroneo
                                    t.test(calidad$IE ~ calidad$Tratamiento, alternative = "greater", var.equal = T)
                                    # Fin de ejemplo erroneo
                                    
                                    
                                    # Efecto de Cohen´s -------------------------------------------------------
                                    
                                    cohens_efecto <- function(x, y) {
                                      n1 <- length(x); n2 <- length(y)
                                      s1 <- sd(x); s2 <- sd(y)
                                      sp <- sqrt(((n1 - 1) + s1^2 + (n2 - 1) * s2^2) / (n1 + n2 - 2))
                                      (mean(x) - mean(y)) / sp
                                    }
                                    
                                    
                                    d1_cal <- cohens_efecto(df_ctrl$IE,df_fert$IE)
                                    d1_cal