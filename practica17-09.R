
datos <- read.table("C://Users//julik//OneDrive//Escritorio//datos_DNI_84.txt", header = TRUE)


tiempo_A <- datos$tiempo[datos$version == "A"]
tiempo_B <- datos$tiempo[datos$version == "B"]


t.test(tiempo_A, tiempo_B, conf.level = 0.95) # t student

mean(tiempo_A) - mean(tiempo_B) - qnorm(1 - 0.05/2)*sqrt(var(tiempo_A) / 45 + var(tiempo_B) / 35) # normal
mean(tiempo_A) - mean(tiempo_B) + qnorm(1 - 0.05/2)*sqrt(var(tiempo_A) / 45 + var(tiempo_B) / 35) # normal