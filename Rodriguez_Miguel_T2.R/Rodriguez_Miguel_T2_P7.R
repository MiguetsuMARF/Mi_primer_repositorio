
#-----------------------------------------------------# Ejercicio 7 #---------------------------------------------------------#

## Elabora un programa que a partir del “poder” de diez personajes (ficticios o no) dado como
## datos de entrada, genere un mensaje para cada uno de ellos que indique el mensaje “con un
## gran poder conlleva una gran responsabilidad” si es que su “poder” es mayor que un valor
## umbral que ustedes determinen de forma arbitraria. De tal forma que, si su personaje es
## spider-man o-b-v-i-a-m-e-n-t-e, les arroje el mensaje del tıo Ben.

# Para que la persona pueda ingresar el nombre y nivel de poder de cada personaje vamos a realizar un vector de 
# readlines, de tal forma que todos los valores nones del vector correspondan a los nombres, y todos los valores 
# pares correspondan al nivel de poder, se hace en un vector para que, al correr la funcion, se impriman uno por uno
# los readlines.
respuestas <- c (readline(prompt = "Cual es el nombre del personaje 1?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "), 
                 readline(prompt = "Cual es el nombre del personaje 2?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 3?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 4?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 5?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 6?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 7?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 8?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 9?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "),
                 readline(prompt = "Cual es el nombre del personaje 10?: "),
                 readline(prompt = "Cual es su nivel de poder del 1 al 20?: "))
# Una vez que tenemos el vector de las respuestas podemos realizar un data.frame que contenga los datos colectados.
# Recordando que los nones son nombres y los pares son poderes podemos asignarlos a una de las variables de la data.frame.
# Como vamos a realizar comparaciones numericas nos va a servir convertir el nivel de poder a numerico con as.numeric.
poderes <- data.frame(
  nombres = c (respuestas[c(1,3,5,7,9,11,13,15,17,19)]), 
  poder = c (as.numeric(respuestas[c(2,4,6,8,10,12,14,16,18,20)]))
)

poderes

# Posteriormente vamos a pedir que se vuelva a ingresar el nombre del personaje cuyo poder vamos a evaluar, asignandolo a
# un nuevo objeto.
personaje_favorito <- readline(prompt = "Cual de estos personajes es tu favorito?: ")

# Posteriormente con la funcion which vamos a buscar el nivel de poder del personaje, buscando la fila cuyo nombre
# sea exactamente igual al nombre ingresado.
poder_personaje <- poderes[which(poderes$nombres == personaje_favorito),2]

# Y finalmente vamos a realizar un if donde, si el nivel de poder del personaje sobrepasa los 12, se imprime el mensaje
# del tio ben.
if (poder_personaje >= 12){
  cat ("Un gran poder conlleva una gran responsabilidad. \n
Tu personaje favorito tiene un nivel de poder de ", poder_personaje)
} else{
  cat ("Probablemente tu personaje tiene responsabilidades, pero no por un gran poder. Sigue intentanto")
}