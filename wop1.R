data(airquality)
?airquality

str(airquality)
class(airquality$Ozone)

summary(airquality)

hist(airquality$Wind,
     main = "Historgrama de Wind",
     xlab = "Wind",
     prob = TRUE, 
     ylab = "Density"
)

hist(airquality$Temp,
     main = "Historgrama de Temp",
     xlab = "Temp",
     prob = TRUE, 
     ylab = "Density"
)
hist(airquality$Temp,
     main = "Historgrama de Temp",
     xlab = "Temp", 
     ylab = "Density"
)

boxplot(airquality$Wind,  outline = TRUE,
        main = "Boxplot de Wind",
        ylab = "Wind")

boxplot(airquality$Temp,  outline = TRUE,
        main = "Boxplot de Temp",
        ylab = "Temp")

outliers_wind <- boxplot.stats(airquality$Wind)$out
outliers_wind_sorted <- sort(outliers_wind, decreasing = TRUE)
print(outliers_wind_sorted)


desvio_estandar <- sd(airquality$Wind, na.rm = TRUE)
distancia_intercuartil <- IQR(airquality$Wind, na.rm = TRUE)
desvio_estandar
distancia_intercuartil
