### Ejercicio 1 ###

datos <- read.csv( "C:\\Users\\julik\\Downloads\\datos_ritmo.csv" , header = TRUE)
datos

## a ##

x <- datos$ritmo
y <- datos$dosis

plot(x, y)

## b ##

b1 <- 10.169*0.4020 # Tobs * SE^(b1^)obs
b1 # Cuando aumentamos un gramo la dosis, aumenta 4.08 el ritmo

## c ##

# 0.05 > 6.25e-07 => Rechazo H0
# Hay evidencia significativa que la dosis de atenolol disminuye el ritmo cardiaco

## d ##

# No, ya que se rechaza b1 = 0

## e ##

# ic1-alfa = b1^ +- talfa/2*se^(b1^), ponemos alfa = 0.05

icobs_izq <- 4.0879 - 2.2010*0.4020
icobs_der <- 4.0879 + 2.2010*0.4020

## f ##



