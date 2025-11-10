######### 2 #########

datos_Experimento <- function(n, mu, sigma){
  return (rnorm(n, mu, sigma))
}


######## 3 #########

ic_mu_sigma_conocida <- function(x, sigma, nivel = 0.95){
  n <- length(x)
  xbar <- mean(x)
  alpha <- 1 - nivel
  z <-  qnorm(1 - alpha/2)
  margen <- z * sigma / sqrt(n)
  inferior <- xbar - margen
  superior <- xbar + margen
  return (c(inferior = inferior, superior = superior))
}


######## 4 #########

set.seed(46919484)

datos1 <- datos_Experimento(100, 6, 2)
datos2 <- datos_Experimento(10, 6, 2)
datos3 <- datos_Experimento(100, 6, 0.01)

ic1 <- ic_mu_sigma_conocida(datos1, 2, 0.8)
print(ic1)
print(ic1[1] <= 6 && 6 <= ic1 [2])
ic2 <- ic_mu_sigma_conocida(datos2, 2, 0.8)
print(ic2)
print(ic2[1] <= 6 && 6 <= ic2 [2])
ic3 <- ic_mu_sigma_conocida(datos3, 0.01, 0.8)
print(ic3)
print(ic3[1] <= 6 && 6 <= ic3 [2])


######## 5 #########
mu_fue_atrapado <- function(mu, sigma, n, nivel) {
  datos <- datos_Experimento(n, mu, sigma)
  ic <- ic_mu_sigma_conocida(datos, mu, nivel)
  if(ic[1] <= mu && mu <= ic [2]){
    return(1) 
  }
  else{
    return(0)
  }
}


######## 6 #########

proporcionAtrapado <- function(mu, sigma, n, nivel, num){
  sum = 0
  for(i in 1:num){
    sum <- sum + mu_fue_atrapado(mu, sigma, n, nivel)
  }
  return(sum/n)
}