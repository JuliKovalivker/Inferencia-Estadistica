### EJERCICIO 1 ### 

datos <- read.csv( "C:\\Users\\julik\\Downloads\\URLADDRESS.csv" , header = TRUE)

x <- URLADDRESS$mconnected
y <- URLADDRESS$megasd


## 1 ##

plot(x, y,
     xlab = "Minutos conectados",
     ylab = "Megabytes descargados")


## 2 ##

# a #

n <- length(x)

B1 <- (sum(x*y)- n*mean(x)*mean(y)) / (sum(x^2) - n*mean(x)^2)
B0 <- mean(y) - B1*mean(x)


# b #

modelo <- lm(y ~ x)
summary(modelo)

## 3 ##

abline(modelo, col="red")
abline(modelo$coefficients[1], modelo$coefficients[2], col="blue") ## son equivalentes



### EJERCICIO 2 ###

set.seed(1)


## 1 ##

n <- 100
x <- runif(n, 75, 125)


## 2 ##

eps <- rnorm(n, 0, sqrt(25))


## 3 ##

y <- -1 + 0.5*x + eps
length(y)


## 4 ##

plot(x, y)


## 5 ##

modelo <- lm(y ~ x)

B1 <- (sum(x*y)- n*mean(x)*mean(y)) / (sum(x^2) - n*mean(x)^2)
B0 <- mean(y) - B1*mean(x)

## 7 ##

abline(modelo, col="red")
legend("bottomright", 
       legend = c("Minimos cuadrados", "puntos"), 
       col = c("blue", "black"))


## 8 ##

set.seed(5)

n <- 100
x <- runif(n, 75, 125)

eps <- rnorm(n, 0, sqrt(25))

y <- -1 + 0.5*x + eps
length(y)

plot(x, y)

modelo <- lm(y ~ x)

B1 <- (sum(x*y)- n*mean(x)*mean(y)) / (sum(x^2) - n*mean(x)^2)
B0 <- mean(y) - B1*mean(x)

abline(modelo, col="red")
legend("bottomright", 
       legend = c("Minimos cuadrados", "puntos"), 
       col = c("blue", "black"))