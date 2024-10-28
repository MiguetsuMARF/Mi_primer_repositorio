
#-----------------------------------------------------# Ejercicio 3 #---------------------------------------------------------#

## Elabora un programa que, a partir de un vector de calificaciones de examenes parciales (3),
## y de un vector de calificaciones de tareas y examenes quincenales (10), determine si esa
## alumnx exentarıa o no el curso de bioinformatica con los criterios que establecimos al inicio
## del curso que puedes consultar en el programa que en el classroom. Asume que en el resto
## de los criterios tienen en 100%

# Primero vamos a generar el vector de calificaciones de parciales, para generar un vector con datos aleatorios del 1 al 10
# donde se puedan repetir los datos vamos a utilizar la funcion sample, de tal forma que se selecciones 3 numeros a azar entre
# el 1 y el 10 con la capacidad de repetirse y asignarlos al vector parciales. 
parciales <- c (sample (1:10, 3, replace = TRUE))
parciales

# Si se quisieran utilizar los datos reales de un alumno entonces podemos utilizar la funcion readline para que el mismo
# asigne los valores de cada parcial.
parciales <- as.numeric (c (readline (prompt = "Cual fue tu calificacion en primer parcial? : "),
                 readline (prompt = "Cual fue tu calificacion en segundo parcial? : "),
                 readline (prompt = "Cual fue tu calificacion en tercer parcial? : ")))

# De igual forma se puede crear el vector con 10 calificaciones aleatorias para las tareas y examenes quincenales.
tareas <- c (sample (1:10, 10, replace = TRUE))
tareas
# o utilizar la funcion readline para preguntar las calificaciones para cada tarea:
tareas <- c (readline (prompt = "Cual fue tu calificacion en tarea 1? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 2? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 3? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 5? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 6? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 7? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 8? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 9? : "),
              readline (prompt = "Cual fue tu calificacion en tarea 10? : "))

# Para poder obtener el puntaje de cada uno de los criterios debemos sacar la media de los valores dentro de cada vector
# y este multiplicarlo por la ponderacion que tiene (en caso de parciales, al tener 50% debemos multiplicar por 0.5)
ponder_parciales <- (mean(parciales))*0.5
ponder_parciales

ponder_tareas <- (mean(tareas))*0.3
ponder_tareas

# Y finalmente asignar el puntaje no especificado en este programa en el que suponemos que el alumno cumplio con el 20% 
# restante, por lo que este extra tiene los 2 puntos completos.
ponder_extra <- 2

# A continuacion vamos a sumar el puntaje obtenido en cada criterio de evaluacion para obtener la calificacion final
calificacion_final <- ponder_extra+ponder_parciales+ponder_tareas
calificacion_final

# Y finalemente vamos a realizar un if donde primero se evalua si el alumno tiene un promedio de parciales aprobatorio.
# si no es aprobatorio entonces es final directo. Luego evaluacion si la calificacion final es menor a 7, si esta condicion
# se cumple, aun cuando el promedio de parciales es aprobatorio, es final directo.
# Y si ambas condiciones no se cumplen, osea, parciales con promedio aprobatorio y calificacion final mayor a 7, entonces el 
# estudiante excenta.
if (ponder_parciales < 3){
  cat ("Siendo el promedio de parciales = ", (ponder_parciales/0.5), "menor a 6.00, el alumno no esta excento de examen final")
}else if (calificacion_final < 7 & ponder_parciales > 3){
  cat ("Siendo el promedio final = ", calificacion_final, "menor a 7.00 \n
y el promedio de parciales = ", (ponder_parciales/0.5), "mayor a 6.00, el alumno no esta excento de examen final")
}else if (calificacion_final > 7 & ponder_parciales > 3){
  cat ("Siendo el promedio final = ", calificacion_final, "mayor a 7.00 \n
y el promedio de parciales = ", (ponder_parciales/0.5), "mayor a 6.00, el alumno esta excento de examen final")
} 
