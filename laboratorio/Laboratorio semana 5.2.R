# Laboratorio semana 5
# comparacion de una muestra
# solo ocupamos la muestra setosa


setosa <- subset(iris, Species =="setosa")
mean(setosa$Sepal.Width)

# mu = 3.9

# HO = la diferwnaic entre las medias es cero o menor a cero = 3.9
# H1 = la diferencia entre media teoretica y experimental es diferente a cero = diferente a 3.9

t.test(setosa$Sepal.Width, mu = 3.6)

