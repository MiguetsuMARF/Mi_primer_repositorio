#Ejercicio 5

ph <- sample(6:9, size = 25, replace = T) # estoy haciendo el vector aleatorio
ph
median(ph) #calculo la mediana

which (ph > 8.5 | ph < 6.5) #le digo que me enseñe los elementos que cumplen una u otra condición
