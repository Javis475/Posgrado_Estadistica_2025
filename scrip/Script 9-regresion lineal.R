#regresion lineal
datos <- data.frame(
  trigo = c(30, 28, 32, 25, 25, 25, 22, 24, 35, 40),
  harina = c(25, 30, 27, 40, 42, 40, 50, 45, 30, 25)
)
datos

sumxi_yi <- sum(datos$trigo*datos$harina)
sumxi_yi # =9734
nxy <- length(datos$trigo)*mean(datos$trigo)*mean(datos$harina)
nxy
sumxi_yi-nxy # =-390.4

xi2 <- sum(datos$trigo^2)
xi2 # =81796

nx2 <- length(datos$trigo)*mean(datos$trigo)^2
nx2 # =81796

b1 <- (sumxi_yi - nxy)/(xi2-nx2)
b1 # =-0.005324024
fit.lm <- lm(datos$harina ~ datos$trigo)
fit.lm$model
fit.lm$coefficients
fit.lm$residuals
mean(fit.lm$residuals)
datos$yprima <- 74.11-1.3536 * datos$trigo
datos$recta <-fit.lm$fitted.values

datos$residuales <- datos$harina-datos$recta
SSE <- sum(datos$residuales^2)
SSE/8
sqrt(SSE/8)

summary(fit.lm)
anova(fit.lm)
#paquetes 
install.packages("lmtest")
library(lmtest)
#modelo
m <- lm(datos$harina ~ datos$trigo)
bptest(fit.lm)







             