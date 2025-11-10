### 1 ###

datos

x <- mean(datos$acuerdo[datos$genero == 1])
n1 <- length(datos$acuerdo[datos$genero == 1])

y <- mean(datos$acuerdo[datos$genero == 0])
n2 <- length(datos$acuerdo[datos$genero == 0])

V_obs <- x*(1-x)/n1 + y*(1-y)/n2
desv_obs <- sqrt(V_obs)

factor <- qnorm(1 - 0.05/2)

izq <- x - y - factor*desv_obs
der <- x - y + factor*desv_obs

c(izq, der)


### 2 ###