
#-----------------------------------------------------# Ejercicio 2 #---------------------------------------------------------#

## Genera un programa que te de 4 numeros reales al azar y con ello genera una matriz de 2 × 2 y a partir de ella:
### a) Calcula la traza de la matriz
### b) Calcula la determinante de la matriz
### c) Calcula, sin utilizar librerıas especializadas, los eigenvalores de la matriz
### d) Si la matriz viene de un problema de puntos de equilibrio en 2 dimensiones, determina 
###    a partir de la traza y determinante, el tipo y clase de estabilidad que tiene.
### e) Si la matriz viene de un problema de puntos de equilibrio en 2 dimensiones, determina
###    a partir de la parte real de los eigenvalores, el tipo y clase de estabilidad que tienen.
### f) Como podrıas genera 100 matrices al azar y demostrar que aproximadamente el 50%
###    de las veces es un punto silla.

# Para generar un vector de 4 numeros al azar podemos utilizar la funcion rnorm, la cual genera una muestra al azar
# de numeros reales, tanto positivos como negativos, en una distribucion normal.

numeros_azar <- rnorm (4) 

# Posteriormente para realizar una matriz 2x2 con este vector podemos utilizar la funcion matrix, en esta ingresamos
# el vector que contiene los elementos y especificamos el numero de columnas que va a tener la matriz con nrow.

matriz <- matrix (numeros_azar, nrow = 2)
matriz

# Para calcular la traza de una matriz tenemos que sumar los elementos que se encuentran en la diagonal de la misma.
# en este caso vamos a utilizar el [] para poder seleccionar elementos especificos contenidos dentro de la matriz,
# esta al tener filas y columnas necesita que ingresemos las coordenadas de esta forma: filas,columnas.

traza <- matriz[1,1] + matriz[2,2]
traza

# Para calcular la determinante de una matriz tenemos que restar la multiplicacion de ambas diagonales, siendo de tal 
# forma que, si tenemos una matriz cuyos elementos son a y b en la primer fila y c y d en la segunda columna, la 
# determinante seria: ad - bc. En este caso lo realizaremos de la misma forma que con la traza.

determinante <- (matriz[1,1]*matriz[2,2]) - (matriz[1,2]*matriz[2,1])
determinante

# Un eigen valor se calcula despejando aquel escalar que al multiplicarse por la matriz identidad y restandose a la 
# matriz objetivo, si sacamos la determinante de este producto obtendremos 0. De tal forma que, al multiplicar al 
# valor (en este caso pongamosle R) con la matriz identidad obtendremos (en filas) R 0, 0 R. Posteriormente esta 
# matriz sera restada a la matriz objetivo (a b, c d) obteniendo: a-R b, c d-R. Al sacar la determinante de esta
# matriz producto obtendremos: R^2 - R (a + d) + (ad-bc) = 0. Si analizamos esta ecuacion resultante observaremos
# que tiene la estructura de una ecuacion cuadratica. Por lo que si utilizamos la ecuacion general seremos capaces
# de obtener los eigen valores. Ademas, al analizar observaremos que el elemento b y c de una ecuacion cuadratica
# normal (ax^2 + bx + c = 0) coinciden con la traza y la determinante, por lo que podemos usar estos elementos ya
# calculados para calcular los eigen valores.

# Ya que queremos obtener un vector que contenga ambos valores, vamos a usar la funcion c para concatenar los 2 
# posibles resultados.

eigen_valores <- c((((traza)+(sqrt((traza^2)-(4*determinante))))/2),(((traza)-(sqrt((traza^2)-(4*determinante))))/2))
eigen_valores

# A continuacion para determinar la clase de equilibrio de un problema de puntos de equilibrio es necesario 
# calcular el delta, que no es otra cosa que el determinante de la formula general.

delta <- (sqrt((traza^2)-(4*determinante)))
delta

# Para determinar la naturaleza y tipo de punto de equilibrio que obtendremos a partir de la matriz es necesario
# saber si el determinante es mayor o menor a 0, si la traza es menor o mayor a 0 y si el delta es menor o mayor
# a 0. Debido a esto se realizo un if cuyas condicionales son especificas para cada tipo de punto de equilibrio.
# Debido a que se tratan de varias condiciones se utiliza el & para que el if solo se cumpla si todas las condiciones
# se cumplan.

if(determinante < 0){
  print ("El punto de equilibrio es un punto silla")
}else if(determinante > 0 & traza < 0 & delta > 0){
  print ("El punto de equilibrio es estable y es un atractor")
}else if(determinante > 0 & traza < 0 & delta < 0){
  print ("El punto de equilibrio es estable y es un atractor espiral")
}else if(determinante > 0 & traza > 0 & delta > 0){
  print ("El punto de equilibrio es inestable y es un repulsor")
}else if(determinante > 0 & traza > 0 & delta < 0){
  print ("El punto de equilibrio es inestable y es un repulsor espiral")
}

# Finalmente para determinar la naturaleza del punto de equilibrio con los eigen valores debemos de determinar 
# si ambos son mayores a 0, menores a 0 o si su producto es menor a 0. Por tanto vamos a utilizar la funcion 
# all, la cual unicamente se cumple como TRUE si todos los elementos del objeto a analizar cumplen la condicion.
# De esta forma, si todos los eigen valores son mayores a 0, se cumple la condicion del all y la condicional del if
# va a leer el TRUE del all para ejecutar.

if(all(eigen_valores>0)){
  print("El punto de equilibrio es inestable")
}else if(all(eigen_valores<0)){
  print("El punto de equilibrio es estable")
}else if((eigen_valores[1]*eigen_valores[2])<0){# En este caso vamos a realizar una operacion con ambos elementos
  # del vector para determinar si se cumple la condicion para el punto de equilibrio de punto silla, para poder
  # seleccionar cada elemento del vector utilizamos el [].
  print("El punto de equilibrio es un punto silla")
}

# Para generar 100 matrices al azar vamos a realizar un objeto que contenga 100 elementos, estos elementos van 
# a ser necesarios para aplicar a cada uno la funcion matrix.
datos <- 1:100

# Posteriormente vamos a utilizar la funcion lapply para que se haga una lista de cada uno de los resultados de la 
# funcion mat en cada elemento del vector datos, en esta caso la funcion sirve para realizar una matriz aleatoria
# de 2x2 por lo que se va a crear una lista de matrices correspondientes a cada elemento del vector datos.
matrices <- lapply (datos, function (mat){
  matrix ((rnorm(4)), nrow = 2)
})
matrices

# Posteriormente podemos usar la misma funcion para aplicar, a cada elemento de la lista matrices, los cuales corresponden
# a una matriz cada una, la funcion dete, para obtener su determinante, por lo que obtendremos una lista de determinantes
# correspondiente a cada elemento de la lista matrices.
determinantes <- lapply (matrices, function (dete){
  (dete[1,1]*dete[2,2]) - (dete[1,2]*dete[2,1])
})

length (determinantes)

# A continuacion crearemos un objeto donde seleccionaremos unicamente a las determinantes del vector determinantes que
# cumplen la condicion de ser mayores a 0, de tal forma que, al usar la funcion length seremos capaces de saber que cantidad
# de determinantes de las 100 generadas cumple la condicion de ser mayor a 0.
determinantes_silla <- as.numeric(determinantes [which (determinantes > 0)])

# Finalmente creamos un if donde la condicion es que la division entre la longitud de la lista de determinantes mayores a 0
# y la lista de determinantes totales debe de ser aproximadamente 0.5, de tal forma que podemos inferir que el 50% de las 
# matrices generadas tiene un punto de equilibrio punto silla. Usamos la funcion cat para poder imprimir el porcentaje especifico.
if (length (determinantes_silla)/length(determinantes) > 0.44 & length (determinantes_silla)/length(determinantes) < 0.56){
  cat ("Se demuestra que en 100 matrices al azar, el 50% van a tener un punto de equilibrio punto silla \n
ya que, en este caso, la cantidad de determinantes positivas entre la cantidad total de determinantes \n
es igual al", (length (determinantes_silla)/length(determinantes))*100, "por ciento.")
}else{
  cat ("No se confirma que en 100 matrices al azar, el 50% van a tener un punto de equilibrio punto silla \n
ya que, en este caso, la cantidad de determinantes positivas entre la cantidad total de determinantes \n
es igual al", length (determinantes_silla)/length(determinantes)*100, "por ciento.")
}
