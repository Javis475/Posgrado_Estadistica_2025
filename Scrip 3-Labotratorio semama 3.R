#scrip 3
#media movil para determianr el n ideal con respecto a la poblacion 
data ("iris")
head(iris)

setosa <- subset(iris, Species == "setosa")
#sumatoria acumulativa de la variable longitud
acumulado <- cumsum(setosa$Sepal.Length)
acumulado # sumatoria acumulada
cont <- seq(1:length(setosa$Sepal.Length))
cont

#crer un data frame con los datos creados 
set_mov <- data.frame(cont, acumulado)
set_mov$movil <- round(acumulado/cont, 2)

plot(cont, set_mov$movil, type = "l",
     xlab = "Número de observaciones",
     ylab = "Media móvil")
abline(h=mean(setosa$Sepal.Length))
col = "red"
abline(h=mean(setosa$Sepal.Length), col="indianred")
```)
mean(setosa$Sepal.Length)


