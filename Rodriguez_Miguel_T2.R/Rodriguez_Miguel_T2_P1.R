
#-----------------------------------------------------# Ejercicio 1 #---------------------------------------------------------#

## Elabora un programa en R, profusamente comentado, que dados los valores de los coeficientes 
## de una ecuacion cuadratica, es decir los valores de a, b, c de la ecuacion ax2 + bx + c = 0
## arroje lo siguiente:
### a) Las dos soluciones cuando estas son reales.
### b) Cuando se tenga solo una solucion lo indique y mande un mensaje diciendo porque solo se tiene una solucion.
### c) Cuando no se tienen soluciones reales que mande un mensaje que indique que no
###    existen soluciones en los numeros reales y explique porque.

# Para realizar este programa es necesario primer definir los valores de la ecuacion cuadratica que se van a utilizar.
# Ya que se trata de un programa que debe de funcionar con cualquier valor vamos a utilizar la funcion readline
# para que la persona que utilice el programa pueda ingresar de forma facil el valor de cada valor de la ecuacion.

a <- as.numeric (readline (prompt = "Cual es el valor de a de tu ecuacion cuadratica?: ")) # Se convierte en valor 
# numerico al valor ingresado en el readline por medio de la funcion as.numeric, de tal forma que se puedan realizar
# operaciones con los valores ingresados.
b <- as.numeric (readline (prompt = "Cual es el valor de b de tu ecuacion cuadratica?: "))
c <- as.numeric (readline (prompt = "Cual es el valor de c de tu ecuacion cuadratica?: "))

# Posteriormente para conocer las posibles soluciones de una ecuacion cuadratica debemos de calcular el discriminante,
# dependiendo de si este tiene valor mayor, igual o menor a 0 seran las posibles soluciones obtenidas. 
# Aquellas ecuaciones con discriminante mayor a 0 tienen 2 posibles soluciones.
# Aquellas ecuaciones con discriminante menor a 0 no tienen soluciones reales posibles.
# Aquellas ecuaciones con discriminante igual a 0 tienen una posible solucion real.
# Por tanto vamos a realizar el calculo del discriminante, ya que es el factor que determinara las soluciones:
# discriminante = b^2 - 4ac

discriminante_ecuacion <- ((b^2)-(4*(a*c)))

# Finalmente para determinar si la ecuacion ingresada tiene 2, 1 o 0 soluciones y resolverlas vamos a realizar 
# un if, donde la condicion determine si el discriminante es mayor, menor o igual a 0, y a partir de esto
# calcule las soluciones con la formula general. De tal forma que, cuando el discriminante es positivo se calcula:
if (discriminante_ecuacion > 0){
  x_1 <- (((-b)+(sqrt(discriminante_ecuacion)))/(2*a))
  x_2 <- (((-b)-(sqrt(discriminante_ecuacion)))/(2*a))
  cat ("Tu ecuacion tiene dos posibles soluciones, esto debido a que el discriminante de la ecuacion es positivo \n
  Discriminante de la ecuacion: ",discriminante_ecuacion, "\n
  la solucion 1 es: ",x_1, "\n
  la solucion 2 es: ",x_2)
}else if (discriminante_ecuacion == 0){ # Cuando el discriminante es igual a 0 se cumple la condicion de este else if
# de tal forma que se realiza el calculo sin el discriminante de la formula general, obteniendo el unico resultado posible.
  x <- (-b)/(2*a)
  cat ("Tu ecuacion tiene una solucion posible, esto debido a que el discriminante de la ecuacion es igual a 0 \n
  Discriminante de la ecuacion: ",discriminante_ecuacion, "\n
  la solucion es: ",x)
}else{ # Finalmente si el discriminante es menor a 0 se cumple la condicion del else, imprimiendo unicamente el mensaje.
  cat ("Tu ecuacion no tiene soluciones reales, esto debido a que el discriminante de la ecuacion es negativo \n
  Discriminante de la ecuacion: ",discriminante_ecuacion, "\n
  por lo que no se puede resolver la ecuacion")
}
