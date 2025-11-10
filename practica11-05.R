# 1 #

datos <- read.table( "C:\\Users\\julik\\Downloads\\datos_DNI_46919484.txt" , header = TRUE)
datos

# 2 #

x <- datos$tiempo
y <- datos$porcentaje

plot(x, y, xlim = c(0, 1025), ylim = c(0, 300))
#plot(x, y) #si

# 3 #

modelo <- lm(y ~ x, data = datos)
abline(modelo, col="blue")

# 4 #

#pendiente: cuanto cambia el porcentaje cuando aumenta el tiempo
#ordenada al origen: porcentaje cuando el tiempo es 0 (no tiene sentido)

# 5 #

summary(modelo) #p-valor muy mini
#Rechazo practicamente siempre la H0, hay asociacion entre las variables (no sabemos si lineal)

# 6 #

b0 <- modelo$coefficients[1]
b1 <- modelo$coefficients[2]


y50 <- b0 + b1*50
y50

y100 <- b0 + b1*100
y100

y200 <- b0 + b1*200
y200

points(c(50, 100, 200), c(y50, y100, y200), col="hotpink", pch=19, bg="hotpink")

# 7 #

y1000 <- b0 + b1*1000
y1000

points(1000, y1000, col="hotpink", pch=19, bg="hotpink")

# 8 #

obs_extra <- data.frame(version = "B",
                        tiempo = 1000,
                        transaccion = 0,
                        porcentaje = 5)
obs_extra
datos_nuevos <- rbind(datos, obs_extra)

x <- datos_nuevos$tiempo
y <- datos_nuevos$porcentaje

modelo2 <- lm(y ~ x, data = datos_nuevos)

plot(x, y, xlim = c(0, 1025), ylim = c(0, 300))

abline(modelo, col="maroon", lwd=2)

abline(modelo2, col="royalblue", lwd=2)
