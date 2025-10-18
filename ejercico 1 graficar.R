# grafica de ejemplo
crop <- read.csv ("C:/Users/Usuario/Desktop/MAESTRIA CF/ESTADISTICA/ejercicios/ejercicio 1.csv")
View(crop)
#grafico
ggplot(datos, aes(x = Mes, y = Nro.de.especies)) +
  geom_bar(stat = "identity", fill = "skyblue") +
  theme_minimal() +
  labs(title = "Número de especies por mes",
       x = "Mes",
       y = "Número de especies") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))
