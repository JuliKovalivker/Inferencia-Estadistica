
### EJERCICIO 1 ###

# a #

set.seed(46919484)

datos1 <- read.table ( "C:\\Users\\julik\\OneDrive\\Escritorio\\UTDT\\Inferencia Estadística\\conjunto1.txt" , header = TRUE )

datos1 <- datos1 [ , c( "version" , "tiempo" ) ]

datos1 $ version <- factor ( datos1 $ version , levels = c ( "A" , "B" ) )

datos2 <- read.table ( "C:\\Users\\julik\\OneDrive\\Escritorio\\UTDT\\Inferencia Estadística\\conjunto1.txt" , header = TRUE )

datos2 <- datos2 [ , c ( "version" , "tiempo" ) ]

datos2 $ version <- factor ( datos2 $ version , levels = c ( "A" , "B" ) )

# b #

unoa <- datos1$tiempo[datos1$version=='A']
µA_1_ <- mean(unoa)
µA_1_

unob <- datos1$tiempo[datos1$version=='B']
µB_1_ <- mean(unob)
µB_1_

δ_1_ <- µB_1_ - µA_1_
δ_1_

µA_2_ <- mean(datos2$tiempo[datos1$version=='A'])
µA_2_

µB_2_ <- mean(datos2$tiempo[datos1$version=='B'])
µB_2_

δ_2_ <- µB_2_ - µA_2_
δ_2_

# H0: µB = µA  vs   H1: µB != µA

# c #

# I #

boxplot(datos1$tiempo[datos1$version=='A'], datos1$tiempo[datos1$version=='B'], names = c("A", "B"))
points(c(1, 2), c(µA_1_, µB_1_), pch = 19, col = "blue")

# II #

cat("\nTest de normalidad - Conjunto 1\n")
with(subset(datos1, version == "A"), print(shapiro.test(tiempo)))
with(subset(datos1, version == "B"), print(shapiro.test(tiempo)))

cat("\nTest de normalidad - Conjunto 2\n")
with(subset(datos2, version == "A"), print(shapiro.test(tiempo)))
with(subset(datos2, version == "B"), print(shapiro.test(tiempo)))

par(mfrow = c(2, 2))

plot_hist_normal <- function(x, titulo){
  media <- mean(x, na.rm = TRUE)
  desvio <- sd(x, na.rm = TRUE)
  hist(x, freq = FALSE, col = "skyblue", border = "black",
       main = titulo, xlab = "Tiempo", ylab = "Densidad")
  curve(dnorm(x, mean = media, sd = desvio), add = TRUE, col = "red", lwd = 2)
}

with(subset(datos1, version == "A"), plot_hist_normal(tiempo, "Conjunto 1 - Versión A"))
with(subset(datos1, version == "B"), plot_hist_normal(tiempo, "Conjunto 1 - Versión B"))

with(subset(datos2, version == "A"), plot_hist_normal(tiempo, "Conjunto 2 - Versión A"))
with(subset(datos2, version == "B"), plot_hist_normal(tiempo, "Conjunto 2 - Versión B"))

# f #

# I #

Tobs <- δ_1_ / (sqrt(sd(unoa)^2 / length(unoa) + sd(unob)^2 /  length(unob)))
print(Tobs)




