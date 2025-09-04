View(temperatura)

head(temperatura) #Primeras 6 filas
dim(temperatura) #Números de filas y columnas
names(temperatura) #Nombre de las columnas
str(temperatura) #Estructura del data frame

summary(temperatura) #Resumen estadístico 
names(temperatura) <- c("Anual", "Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic") #Corregir nombre de columna anual

temperatura$media_anual <- rowMeans(temperatura[ ,2:13])
head(temperatura)
# personalizar la gráfica con la temperatura de 20 años de 2000 a 2020

temp <- temperatura[ ,2:13]
colores <- c( "navajowhite", "salmon" , "skyblue" )
boxplot(temp, col = colores, 
        main = "comportamiento temperatura (2000 a 2020",
        xlab = "meses",
        ylab =  "temperatura (°c)") 
# personalizar grafica con la temperatura de 10 años de 2010 a 2020
write.csv(temperatura, "temp_final.csv")
temp10 <- temperatura[11:21,2:13]
temperatura[2,2]
boxplot(temp10, col = colores, 
        main = "comportamiento temperatura (2010 a 2020",
        xlab = "meses",
        ylab =  "temperatura (°c)")
javier
        