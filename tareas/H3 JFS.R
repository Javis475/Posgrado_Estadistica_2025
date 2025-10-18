# HW3
# Crear los datos
concentracion <- c(
  28.2, 33.2, 36.4, 34.6, 29.1, 31.0,  # Grayson's Pond
  39.6, 40.8, 37.9, 37.1, 43.6, 42.4,  # Beaver Lake
  46.3, 42.1, 43.5, 48.8, 43.7, 40.1,  # Angler's Cove
  41.0, 44.1, 46.4, 40.2, 38.6, 36.3,  # Appletree Lake
  56.3, 54.1, 59.4, 62.7, 60.0, 57.3   # Rock River
)

# sitio
sitio  <- factor(rep(c("Graysons Pond", "Beaver Lake", "Anglers Cove", "Appletree Lake", "Rock River"), each = 6))

# ANOVA
anova_result <- aov(concentracion ~ sitio)

# Mostrar la tabla de ANOVA
summary(anova_result)
#prueba LSD
MS_res <- 9.8           # Mean Square Residual (Residuals Mean Sq)
n <- 6                  # Número de observaciones por grupo
df_res <- 25            # Grados de libertad del residuo
alpha <- 0.05

# Valor crítico t
t_crit <- qt(1 - alpha/2, df = df_res)

# Cálculo LSD
LSD <- t_crit * sqrt(2 * MS_res / n)
LSD
# Calcular medias por grupo
media_por_sitio <- tapply(concentracion, sitio, mean)
media_por_sitio

# medias por sitio
media_por_sitio <- c(
  "Anglers Cove"   = 44.08333,
  "Appletree Lake" = 41.10000,
  "Beaver Lake"    = 40.23333,
  "Graysons Pond"  = 32.08333,
  "Rock River"     = 58.30000
)
LSD <- 3.722394   # tu valor calculado

# Crear todas las combinaciones de pares
pares <- t(combn(names(media_por_sitio), 2))

# Calcular diferencias absolutas
diferencias <- abs(media_por_sitio[pares[,1]] - media_por_sitio[pares[,2]])

# Comparar con el LSD y generar una columna de "Sí/No"
signif_LSD <- ifelse(diferencias > LSD, "Sí", "No")

# Tabla final
tabla_comparacion <- data.frame(
  Comparación = paste(pares[,1], "-", pares[,2]),
  Diferencia  = round(diferencias, 2),
  Significativa = signif_LSD,
  stringsAsFactors = FALSE
)

# Ordenar por diferencia 
tabla_comparacion <- tabla_comparacion[order(-tabla_comparacion$Diferencia), ]

# resultado en consola
print(tabla_comparacion, row.names = FALSE)


# Prueba Tukey HSD
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
# Parámetros
alpha <- 0.05
k <- 5        # Número de grupos
gl_error <- 25  # Grados de libertad del error

# Valor crítico q
q_crit <- qtukey(1 - alpha, nmeans = k, df = gl_error)
q_crit
# MS_res del ANOVA
MS_res <- 9.8
n <- 6

# DMS de Tukey
DMS_Tukey <- q_crit * sqrt(MS_res / n)
DMS_Tukey
# === Datos previos ===
media_por_sitio <- c(
  "Anglers Cove"   = 44.08333,
  "Appletree Lake" = 41.10000,
  "Beaver Lake"    = 40.23333,
  "Graysons Pond"  = 32.08333,
  "Rock River"     = 58.30000
)

LSD <- 3.722394   # valor LSD
# resultado del ANOVA
anova_result <- aov(concentracion ~ sitio)

# === 1) Comparaciones LSD ===
pares <- t(combn(names(media_por_sitio), 2))
dif_LSD <- abs(media_por_sitio[pares[,1]] - media_por_sitio[pares[,2]])
sig_LSD <- ifelse(dif_LSD > LSD, "Sí", "No")

tabla_LSD <- data.frame(
  Par = paste(pares[,1], "-", pares[,2]),
  Dif = round(dif_LSD, 2),
  LSD_Signif = sig_LSD,
  stringsAsFactors = FALSE
)

# Comparaciones Tukey ===
tuk <- TukeyHSD(anova_result)$sitio
# renombrar tabla
tabla_Tukey <- data.frame(
  Par = rownames(tuk),
  Tukey_Dif = round(tuk[,"diff"], 2),
  Tukey_p   = round(tuk[,"p adj"], 4),
  Tukey_Signif = ifelse(tuk[,"p adj"] < 0.05, "Sí", "No"),
  stringsAsFactors = FALSE
)

# Unir tablas
tabla_Tukey$Par <- gsub("-", " - ", tabla_Tukey$Par)

comparacion <- merge(tabla_LSD, tabla_Tukey,
                     by = "Par", all = TRUE, sort = FALSE)

# resultado 
comparacion[order(-comparacion$Dif), ]

# seccion preguntas
#Ho no hay deiferencias significativas de concentracion entre sitios 
# H1 hay diferecia significativa entre al menos dos sitios 
# se rechaza la hipotesis nula 
# Rock River tiene, con claridad, la concentración media más alta
# Anglers Cove, Appletree Lake y Beaver Lake constituyen un conjunto sin diferencias significativas entre sí
#Elevadas concentraciones en Rock River sugieren mayor carga de nutrientes o contaminantes (p. ej., fósforo, nitratos, metales)
# esto puede causar eutrofizacion, puede ser derivado de una fuente de contaminacion puntual
# Graysons Pond muestra las concentraciones más baja
# HW3
# Crear los datos
concentracion <- c(
  28.2, 33.2, 36.4, 34.6, 29.1, 31.0,  # Grayson's Pond
  39.6, 40.8, 37.9, 37.1, 43.6, 42.4,  # Beaver Lake
  46.3, 42.1, 43.5, 48.8, 43.7, 40.1,  # Angler's Cove
  41.0, 44.1, 46.4, 40.2, 38.6, 36.3,  # Appletree Lake
  56.3, 54.1, 59.4, 62.7, 60.0, 57.3   # Rock River
)
# ANOVA
anova_result <- aov(concentracion ~ sitio)

# Mostrar la tabla de ANOVA
summary(anova_result)
#prueba LSD
MS_res <- 9.8           # Mean Square Residual (Residuals Mean Sq)
n <- 6                  # Número de observaciones por grupo
df_res <- 25            # Grados de libertad del residuo
alpha <- 0.05

# Valor crítico t
t_crit <- qt(1 - alpha/2, df = df_res)

# Cálculo LSD
LSD <- t_crit * sqrt(2 * MS_res / n)
LSD
# Calcular medias por grupo
media_por_sitio <- tapply(concentracion, sitio, mean)
media_por_sitio

# medias por sitio
media_por_sitio <- c(
  "Anglers Cove"   = 44.08333,
  "Appletree Lake" = 41.10000,
  "Beaver Lake"    = 40.23333,
  "Graysons Pond"  = 32.08333,
  "Rock River"     = 58.30000
)
LSD <- 3.722394   # tu valor calculado

# Crear todas las combinaciones de pares
pares <- t(combn(names(media_por_sitio), 2))

# Calcular diferencias absolutas
diferencias <- abs(media_por_sitio[pares[,1]] - media_por_sitio[pares[,2]])

# Comparar con el LSD y generar una columna de "Sí/No"
signif_LSD <- ifelse(diferencias > LSD, "Sí", "No")

# Tabla final
tabla_comparacion <- data.frame(
  Comparación = paste(pares[,1], "-", pares[,2]),
  Diferencia  = round(diferencias, 2),
  Significativa = signif_LSD,
  stringsAsFactors = FALSE
)

# Ordenar por diferencia 
tabla_comparacion <- tabla_comparacion[order(-tabla_comparacion$Diferencia), ]

# resultado en consola
print(tabla_comparacion, row.names = FALSE)


# Prueba Tukey HSD
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
# Parámetros
alpha <- 0.05
k <- 5        # Número de grupos
gl_error <- 25  # Grados de libertad del error

# Valor crítico q
q_crit <- qtukey(1 - alpha, nmeans = k, df = gl_error)
q_crit
# MS_res del ANOVA
MS_res <- 9.8
n <- 6

# DMS de Tukey
DMS_Tukey <- q_crit * sqrt(MS_res / n)
DMS_Tukey
# === Datos previos ===
media_por_sitio <- c(
  "Anglers Cove"   = 44.08333,
  "Appletree Lake" = 41.10000,
  "Beaver Lake"    = 40.23333,
  "Graysons Pond"  = 32.08333,
  "Rock River"     = 58.30000
)

LSD <- 3.722394   # valor LSD
# resultado del ANOVA
anova_result <- aov(concentracion ~ sitio)

# === 1) Comparaciones LSD ===
pares <- t(combn(names(media_por_sitio), 2))
dif_LSD <- abs(media_por_sitio[pares[,1]] - media_por_sitio[pares[,2]])
sig_LSD <- ifelse(dif_LSD > LSD, "Sí", "No")

tabla_LSD <- data.frame(
  Par = paste(pares[,1], "-", pares[,2]),
  Dif = round(dif_LSD, 2),
  LSD_Signif = sig_LSD,
  stringsAsFactors = FALSE
)

# Comparaciones Tukey ===
tuk <- TukeyHSD(anova_result)$sitio
# renombrar tabla
tabla_Tukey <- data.frame(
  Par = rownames(tuk),
  Tukey_Dif = round(tuk[,"diff"], 2),
  Tukey_p   = round(tuk[,"p adj"], 4),
  Tukey_Signif = ifelse(tuk[,"p adj"] < 0.05, "Sí", "No"),
  stringsAsFactors = FALSE
)

# Unir tablas
tabla_Tukey$Par <- gsub("-", " - ", tabla_Tukey$Par)

comparacion <- merge(tabla_LSD, tabla_Tukey,
                     by = "Par", all = TRUE, sort = FALSE)

# resultado 
comparacion[order(-comparacion$Dif), ]

# seccion preguntas
#Ho no hay deiferencias significativas de concentracion entre sitios 
# H1 hay diferecia significativa entre al menos dos sitios 
# se rechaza la hipotesis nula 
# Rock River tiene, con claridad, la concentración media más alta
# Anglers Cove, Appletree Lake y Beaver Lake constituyen un conjunto sin diferencias significativas entre sí
#Elevadas concentraciones en Rock River sugieren mayor carga de nutrientes o contaminantes (p. ej., fósforo, nitratos, metales)
# esto puede causar eutrofizacion, puede ser derivado de una fuente de contaminacion puntual
# Graysons Pond muestra las concentraciones más baja
# HW3
# Crear los datos
concentracion <- c(
  28.2, 33.2, 36.4, 34.6, 29.1, 31.0,  # Grayson's Pond
  39.6, 40.8, 37.9, 37.1, 43.6, 42.4,  # Beaver Lake
  46.3, 42.1, 43.5, 48.8, 43.7, 40.1,  # Angler's Cove
  41.0, 44.1, 46.4, 40.2, 38.6, 36.3,  # Appletree Lake
  56.3, 54.1, 59.4, 62.7, 60.0, 57.3   # Rock River
)
# ANOVA
anova_result <- aov(concentracion ~ sitio)

# Mostrar la tabla de ANOVA
summary(anova_result)
#prueba LSD
MS_res <- 9.8           # Mean Square Residual (Residuals Mean Sq)
n <- 6                  # Número de observaciones por grupo
df_res <- 25            # Grados de libertad del residuo
alpha <- 0.05

# Valor crítico t
t_crit <- qt(1 - alpha/2, df = df_res)

# Cálculo LSD
LSD <- t_crit * sqrt(2 * MS_res / n)
LSD
# Calcular medias por grupo
media_por_sitio <- tapply(concentracion, sitio, mean)
media_por_sitio

# medias por sitio
media_por_sitio <- c(
  "Anglers Cove"   = 44.08333,
  "Appletree Lake" = 41.10000,
  "Beaver Lake"    = 40.23333,
  "Graysons Pond"  = 32.08333,
  "Rock River"     = 58.30000
)
LSD <- 3.722394   # tu valor calculado

# Crear todas las combinaciones de pares
pares <- t(combn(names(media_por_sitio), 2))

# Calcular diferencias absolutas
diferencias <- abs(media_por_sitio[pares[,1]] - media_por_sitio[pares[,2]])

# Comparar con el LSD y generar una columna de "Sí/No"
signif_LSD <- ifelse(diferencias > LSD, "Sí", "No")

# Tabla final
tabla_comparacion <- data.frame(
  Comparación = paste(pares[,1], "-", pares[,2]),
  Diferencia  = round(diferencias, 2),
  Significativa = signif_LSD,
  stringsAsFactors = FALSE
)

# Ordenar por diferencia 
tabla_comparacion <- tabla_comparacion[order(-tabla_comparacion$Diferencia), ]

# resultado en consola
print(tabla_comparacion, row.names = FALSE)


# Prueba Tukey HSD
tukey_result <- TukeyHSD(anova_result)
print(tukey_result)
# Parámetros
alpha <- 0.05
k <- 5        # Número de grupos
gl_error <- 25  # Grados de libertad del error

# Valor crítico q
q_crit <- qtukey(1 - alpha, nmeans = k, df = gl_error)
q_crit
# MS_res del ANOVA
MS_res <- 9.8
n <- 6

# DMS de Tukey
DMS_Tukey <- q_crit * sqrt(MS_res / n)
DMS_Tukey
# === Datos previos ===
media_por_sitio <- c(
  "Anglers Cove"   = 44.08333,
  "Appletree Lake" = 41.10000,
  "Beaver Lake"    = 40.23333,
  "Graysons Pond"  = 32.08333,
  "Rock River"     = 58.30000
)

LSD <- 3.722394   # valor LSD
# resultado del ANOVA
anova_result <- aov(concentracion ~ sitio)

# === 1) Comparaciones LSD ===
pares <- t(combn(names(media_por_sitio), 2))
dif_LSD <- abs(media_por_sitio[pares[,1]] - media_por_sitio[pares[,2]])
sig_LSD <- ifelse(dif_LSD > LSD, "Sí", "No")

tabla_LSD <- data.frame(
  Par = paste(pares[,1], "-", pares[,2]),
  Dif = round(dif_LSD, 2),
  LSD_Signif = sig_LSD,
  stringsAsFactors = FALSE
)

# Comparaciones Tukey ===
tuk <- TukeyHSD(anova_result)$sitio
# renombrar tabla
tabla_Tukey <- data.frame(
  Par = rownames(tuk),
  Tukey_Dif = round(tuk[,"diff"], 2),
  Tukey_p   = round(tuk[,"p adj"], 4),
  Tukey_Signif = ifelse(tuk[,"p adj"] < 0.05, "Sí", "No"),
  stringsAsFactors = FALSE
)

# Unir tablas
tabla_Tukey$Par <- gsub("-", " - ", tabla_Tukey$Par)

comparacion <- merge(tabla_LSD, tabla_Tukey,
                     by = "Par", all = TRUE, sort = FALSE)

# resultado 
comparacion[order(-comparacion$Dif), ]

# seccion preguntas
#Ho no hay deiferencias significativas de concentracion entre sitios 
# H1 hay diferecia significativa entre al menos dos sitios 
# se rechaza la hipotesis nula 
# Rock River tiene, con claridad, la concentración media más alta
# Anglers Cove, Appletree Lake y Beaver Lake constituyen un conjunto sin diferencias significativas entre sí
#Elevadas concentraciones en Rock River sugieren mayor carga de nutrientes o contaminantes (p. ej., fósforo, nitratos, metales)
# esto puede causar eutrofizacion, puede ser derivado de una fuente de contaminacion puntual
# Graysons Pond muestra las concentraciones más baja




