  ### 1 ###
  ### a ###
  
  datos_1_
  
  c_muestra <- datos_1_$examen[datos_1_$capital==1]
  c <- mean(c_muestra)
  
  p_muestra <- datos_1_$examen[datos_1_$capital==0]
  p <- mean(p_muestra)
        
  c(c, p)
  
  boxplot(c_muestra, p_muestra, names = c("Capital", "!Capital"))
  points(c(1, 2), c(c, p), pch = 19, col = "blue")
  
  # Los de capital tienen mejores notas en el examen
  
  c - p
  
  # tamaños muestrales
  n1 <- length(c_muestra)
  n2 <- length(p_muestra)
  
  # varianzas muestrales
  s1_sq <- var(c_muestra)
  s2_sq <- var(p_muestra)
  
  # error estándar de la diferencia
  EE <- sqrt(s1_sq/n1 + s2_sq/n2)
  EE
  
  # diferencia de medias
  diff_medias <- c - p
  
  # valor crítico para IC del 90%
  z <- qnorm(0.95)  # 1.645 aprox
  
  # intervalo de confianza
  IC_inf <- diff_medias - z * EE
  IC_sup <- diff_medias + z * EE
  
  c(IC_inf, IC_sup)
  
 