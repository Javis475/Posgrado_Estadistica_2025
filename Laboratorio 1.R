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
Celular <-- 300
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
        
        