# analisis de varaianza
# productivdad de cultivos
# 18/09/2025

crop <- read.csv("C:/Repositorio/crop.data.csv")
View(crop)               
crop$density <- as.factor(crop$density)
crop$block <- as.factor(crop$block)
crop$fertilizer <- as.factor(crop$fertilizer)
summary(crop)



colores <- c("indianred", "skyblue", "navajowhite")
boxplot(crop$yield ~ crop$fertilizer, 
        col= colores, 
        xlab= "fertilizantes", 
        ylab= "rendimiento (ton/ha)")

tapply(crop$yield, crop$fertilizer, mean)
tapply(crop$yield, crop$fertilizer, var)

#aplicar prueba de normalidad de datos para cada 
#fertilizante combinado subset y shapiro

shapiro.test(subset(crop$yield, crop$fertilizer == "1"))
shapiro.test(subset(crop$yield, crop$fertilizer =="2"))
shapiro.test(subset(crop$yield, crop$fertilizer == "3"))

#prueba de barlett
# se usa para tres tratamietnsos 
bartlett.test(crop$yield ~ crop$fertilizer)

#aplicar analisis de varianza ANOVA
crop.aov <- aov(crop$yield ~ crop$fertilizer)
summary(crop.aov)


#LSD para determinar el minimo valor 
qt(0.0975, 93)

sqrt((2*0.3859)/32 * qt(0.975, 93)
tapply(crop$yield, crop$fertilizer, mean)
# primer diferencia de medias f1 vs f2

176.757 - 176.9332
# # primer diferencia de media f2 vs f3 
176.9332 - 177.3562
 # # primer diferencia de media f1 vs f3 
176.757 - 177.3562



#prueba de tuckey
sqrt((2*0.3859)/32 * qtukey(0.95, nmeans = 3, df = 93)
plot(TukeyHSD(crop.aov))


library(ggplot2)
ggplot(crop, aes(x=fertilizer, y = yield, fill = 
                   fertilizer))+
  geom_violin(alpha = 0.5)+
  geom_jitter(col = "black")+
  geom_boxplot(width = 0.1, col = "white")
  theme_light()



