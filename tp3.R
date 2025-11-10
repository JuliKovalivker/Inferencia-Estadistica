### 0 ###
ic_sigma_con <- function(datos, sigma2, nivel = 0.95) {
  n <- length(datos)
  media_muestral <- mean(datos)
  sigma <- sqrt(sigma2)
  alpha <- 1 - nivel
  z <- qnorm(1 - alpha/2)
  margen <- z * sigma / sqrt(n)
  return (c(inferior = media_muestral - margen, superior = media_muestral + margen))
}

### 1 ###
set.seed(2)
datos_normales <- rnorm(7, mean = 75, sd = 5)
ic <- ic_sigma_con(datos_normales, sigma2 = 25, nivel = 0.99)
format(ic, digits = 10, decimal.mark = ",")
cat("μ pertenece al ICobs?", ic[1] <= 75 && 75 <= ic[2])

### 2 ###
set.seed(3)
Nrep <- 10000
n <- 7
mu <- 75
sigma2 <- 25
nivel <- 0.95
suma <- 0
for (i in 1:Nrep) {
  datos <- rnorm(n, mean = mu, sd = sqrt(sigma2))
  ic <- ic_sigma_con(datos, sigma2, nivel)
  suma <- suma + (ic[1] <= mu && mu <= ic[2])
}
proporcion <- (suma / Nrep)
cat("la proporcion que contiene a μ es:", proporcion)
