datos <- read.table("C://Users//julik//Downloads//datos_DNI_42.txt", header=TRUE)
datos

tiempo <- datos$tiempo
trans <- datos$transaccion

plot(tiempo, trans)

modelo <-lm(trans ~ tiempo, datos)
abline(modelo)

modelo2 <-glm(trans ~ tiempo, binomial, datos)

tiempo_seq <- seq(min(tiempo), max(tiempo)) #chat
pred <- predict(modelo2, newdata = data.frame(tiempo = tiempo_seq), type = "response") #chat
lines(tiempo_seq, pred, lwd = 2, col="royalblue") #chat