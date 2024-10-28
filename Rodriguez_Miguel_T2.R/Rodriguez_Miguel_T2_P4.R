
#-----------------------------------------------------# Ejercicio 4 #---------------------------------------------------------#

## Estructuras de seleccion
## Elabora un programa que a partir de la fecha de nacimiento de cualquier persona, dando
## como datos de entrada dıa, mes y a ̃no en formato numerico calcule lo siguiente:
###  • Su edad en a ̃nos
###  • Su signo zodiacal
###  • La estacion del año en el que nacio.

# Para empezar vamos a realizar un vector que contenga la fecha de nacimiento. Por tanto vamos a usar la funcion
# readline para que la persona pueda ingresar sus datos, los cuales se van a asignar en las siguientes posiciones:
# - dia de nacimiento = [1]
# - mes de nacimiento = [2]
# - año de nacimiento = [3]
# ademas de que vamos a convertir todos los elementos del vector en numericos con as.numeric para poder realizar
# operaciones matematicas con estos elementos.
fecha_nacimiento <- as.numeric (c (readline (prompt = "Que dia naciste? (en numero del 1 al 31): "), 
                                 readline (prompt = "Que mes naciste? (en numero del 1 al 12): "),
                                 readline (prompt = "Que año naciste? (en numero del 1 al 2024): ")))
fecha_nacimiento

# Ademas para poder estimar la edad de la persona necesitamos saber "que dia es hoy?", por lo que vamos a crear
# un segundo vector de la misma forma que el anterior, para poder realizar la estimacion de la edad.
dia_hoy <- as.numeric (c (readline (prompt = "Que dia es hoy? (en numero del 1 al 31): "), 
                          readline (prompt = "En que mes estamos? (en numero del 1 al 12): "),
                          readline (prompt = "en que año estamos? (en numero del 1 al 2024): ")))
dia_hoy

# Para calcular la edad tenemos muchos condicionales.
# 1: si el mes actual es mayor al mes de nacimiento entonces el cumpleaños ya pasó, por lo que podemos estimar la edad
# restando el año de nacimiento al año actual. Por otro lado si el mes de nacimiento es mayor al mes actual entonces 
# significa que el cumpleaños todavia no pasa, por lo que la edad seria la diferencia entre el año actual y el año de 
# nacimiento menos 1, ya que todavia no cumple años la persona.
# 2: si los meses son los mismos entonces debemos fijarnos en el dia, si el dia actual es mayor al dia de nacimiento 
# entonces el cumpleaños ya paso, por lo que podemos suponer que la edad sera la resta al año actual de el año
# de nacimiento. Por otro lado si el dia actual es menor al dia de nacimiento podemos suponer que el cumpleaños todavia
# no pasa, por lo que la edad sera la resta al año actual de el año de nacimiento -1.
# 3: Finalmente si dia y mes coinciden con el dia y mes de nacimiento podemos suponer que la persona esta cumpliendo años
# por lo que la edad seria la resta al año actual de el año de nacimiento.

if (fecha_nacimiento[2] < dia_hoy[2]){
  cat ("Tu edad es de : ", (dia_hoy[3]-fecha_nacimiento[3]))
} else if (fecha_nacimiento[2] == dia_hoy[2] & fecha_nacimiento[1] < dia_hoy[1]){
  cat ("tu edad es de : ", (dia_hoy[3]-fecha_nacimiento[3]))
} else if (fecha_nacimiento[2] > dia_hoy[2]){
  cat ("Tu edad es de : ", ((dia_hoy[3]-fecha_nacimiento[3])-1))
} else if (fecha_nacimiento[2] == dia_hoy[2] & fecha_nacimiento[1] > dia_hoy[1]){
  cat ("tu edad es de : ", ((dia_hoy[3]-fecha_nacimiento[3])-1))
} else if (fecha_nacimiento[2] == dia_hoy[2] & fecha_nacimiento[1] == dia_hoy[1]){
  cat ("Tu edad es de : ", (dia_hoy[3]-fecha_nacimiento[3]), ", Feliz cumpleaños!")
}

# Para poder estimar cual es el signo zodiacal de una persona debemos fijarnos en el mes y dia de nacimiento, cada 
# signo zodiacal tiene un rango de dias en 2 meses, por lo que, hace falta crear 2 condicionales por cada
# signo zodiacal, el condicional para el primer mes donde las personas con dia de nacimiento mayor o igual al limite
# inferior del inicio del signo zodiacal pero con mes de nacimiento igual al primer mes del signo, seran incluidos, mientras
# que aquellos con dia menor o igual al limite superior del final del signo pero con mes de nacimiento igual al 
# segundo mes del signo, igualmente seran incluidos, esto se aplico para cada uno de los signos, considerando los limites
# superiores e inferiores de cada uno.
if (fecha_nacimiento[1] >= 22 & fecha_nacimiento[2] == 12){
  print ("eres capricornio")
} else if (fecha_nacimiento[1] <= 20 & fecha_nacimiento[2] == 1){
  print ("eres capricornio")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 1){
  print ("eres acuario")
} else if (fecha_nacimiento[1] <= 19 & fecha_nacimiento[2] == 2){
  print ("eres acuario")
} else if (fecha_nacimiento[1] >= 20 & fecha_nacimiento[2] == 2){
  print ("eres piscis")
} else if (fecha_nacimiento[1] <= 20 & fecha_nacimiento[2] == 3){
  print ("eres piscis")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 3){
  print ("eres aries")
} else if (fecha_nacimiento[1] <= 20 & fecha_nacimiento[2] == 4){
  print ("eres aries")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 4){
  print ("eres tauro")
} else if (fecha_nacimiento[1] <= 20 & fecha_nacimiento[2] == 5){
  print ("eres tauro")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 5){
  print ("eres geminis")
} else if (fecha_nacimiento[1] <= 20 & fecha_nacimiento[2] == 6){
  print ("eres geminis")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 6){
  print ("eres cancer")
} else if (fecha_nacimiento[1] <= 22 & fecha_nacimiento[2] == 7){
  print ("eres cancer")
} else if (fecha_nacimiento[1] >= 23 & fecha_nacimiento[2] == 7){
  print ("eres leo")
} else if (fecha_nacimiento[1] <= 23 & fecha_nacimiento[2] == 8){
  print ("eres leo")
} else if (fecha_nacimiento[1] >= 24 & fecha_nacimiento[2] == 8){
  print ("eres virgo")
} else if (fecha_nacimiento[1] <= 22 & fecha_nacimiento[2] == 9){
  print ("eres virgo")
} else if (fecha_nacimiento[1] >= 23 & fecha_nacimiento[2] == 9){
  print ("eres libra")
} else if (fecha_nacimiento[1] <= 23 & fecha_nacimiento[2] == 10){
  print ("eres libra")
} else if (fecha_nacimiento[1] >= 24 & fecha_nacimiento[2] == 10){
  print ("eres escorpio")
} else if (fecha_nacimiento[1] <= 22 & fecha_nacimiento[2] == 11){
  print ("eres escorpio")
} else if (fecha_nacimiento[1] >= 23 & fecha_nacimiento[2] == 11){
  print ("eres sagitario")
} else if (fecha_nacimiento[1] <= 21 & mescum == 12){
  print ("eres sagitario")
}

# Las estaciones del año tienen caracteristicas similares, un mes con limite inferior, 2 meses completos de covertura
# y un cuarto mes con el limite superior, por lo que, hay tres posibilidades para estar incluido en una estacion:
# 1: Naciste en el mes inferior pero con un dia mayor o igual al limite de este mes (inferior), por lo que estas incluido en la estacion.
# 2: naciste en los 2 meses completos que cubre la estacion (intermedios), por lo que estas incluido totalmente.
# 3: naciste en el mes superior pero con un dia menor o igual al limite de este mes (superior), por lo que estas incluido en la estacion.
# Por lo que se crea una condicional por cada una de las posibilidades para cada una de las estaciones, terminando
# con 12 condicionales diferentes que pueden llevarte a 4 estaciones diferentes (ya que cada estacion tiene 3 posibilidades)
if (fecha_nacimiento[2] >= 1 & fecha_nacimiento[2] <= 2){
  print ("naciste en invierno")
} else if (fecha_nacimiento[1] <= 20 & fecha_nacimiento[2] == 3){
  print ("naciste en invierno pero en marzo")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 12){
  print ("naciste en inverno pero en diciembre")
} else if (fecha_nacimiento[2] >= 4 & fecha_nacimiento[2] <= 5){
  print ("naciste en primavera")
} else if (fecha_nacimiento[1] >= 20 & fecha_nacimiento[2] == 3){
  print ("naciste en primavera pero en marzo")
} else if (fecha_nacimiento[1] <= 21 & fecha_nacimiento[2] == 6){
  print ("naciste en primavera pero en junio")
} else if (fecha_nacimiento[2] >= 7 & fecha_nacimiento[2] <= 8){
  print ("naciste en verano")
} else if (fecha_nacimiento[1] >= 21 & fecha_nacimiento[2] == 6){
  print ("naciste en verano pero en junio")
} else if (fecha_nacimiento[1] <= 22 & fecha_nacimiento[2] == 8){
  print ("naciste en verano pero en septiembre")
} else if (fecha_nacimiento[2] >= 9 & fecha_nacimiento[2] <= 11){
  print ("naciste en otoño")
} else if (fecha_nacimiento[1] >= 22 & fecha_nacimiento[2] == 8){
  print ("naciste en otoño pero en septiembre")
} else if (fecha_nacimiento[1] <= 21 & fecha_nacimiento[2] == 12){
  print ("naciste en otoño pero en diciembre")
}  
