
#-----------------------------------------------------# Ejercicio 8 #---------------------------------------------------------#

## El programa debe pedir al usuario, su nombre, su peso (en kg) y altura (en metros), calcular
## su IMC, y luego imprimir en pantalla tanto el IMC como la categor ́ıa correspondiente.
## Asegurate que tu programa sea robusto ante errores que el usuario pueda cometer. 
## A partir de eso se define categor ́ıas de IMC: Segun la Organizacion Mundial de la Salud
## (OMS), las categorias de IMC son las siguientes:
##  • Bajo peso: IMC menor a 18.5
##  • Normal: IMC entre 18.5 y 24.9
##  • Sobrepeso: IMC entre 25.0 y 29.9
##  • Obesidad: IMC igual o mayor a 30.0
## El programa debe pedir al usuario, su nombre, su peso (en kg) y altura (en metros), calcular
## su IMC, y luego imprimir en pantalla tanto el IMC como la categoria correspondiente.
## Asegurate que tu programa sea robusto ante errores que el usuario pueda cometer.

# Para obtener los datos del usuario vamos a realizar un vector de readlines que pida los datos correspondientes.
datos_usuario <- c (readline(prompt = "Ingrese su nombre en mayusculas, con _ separando en lugar de espacios y sin acentos: "),
                    readline(prompt = "Ingrese su peso en kilogramos, con maximo 2 decimales: "),
                    readline(prompt = "Ingrese su altura en metros, con maximo 2 decimales: "))
class (datos_usuario)
# Posteriormente para poder tener un objeto con datos mixtos (de tipo numerico y caracter) vamos a realizar un data.frame
# con los datos anteriormente ingresados.
Datos <- data.frame(
  Nombre = datos_usuario[1],
  Peso = as.numeric(datos_usuario[2]),
  Altura = as.numeric(datos_usuario[3])
)

# Como ya tenemos datos numericos ya podemos realizar operaciones con los mismos, por lo que podemos hacer el 
# calculo del IMC.
IMC <- Datos[1,2]/(Datos[1,3]^2)
IMC

# Y finalmente vamos a realizar un if donde, dependiendo del rango de IMC que tenga el usuario, va a imprimir 
# una respuesta asignandolo a una categoria especifica.
if (IMC < 18.5){
  cat ("El usuario de nombre ", Datos[1,1], "tiene un indice de masa corporal (IMC) de: ", IMC, ". \n
Pertenece a la categoria de bajo peso")
}else if (IMC >= 18.5 & IMC <= 24.9){
  cat ("El usuario de nombre ", Datos[1,1], "tiene un indice de masa corporal (IMC) de: ", IMC, ". \n
Pertenece a la categoria de peso normal")
}else if (IMC >= 25.0 & IMC <= 29.9){
  cat ("El usuario de nombre ", Datos[1,1], "tiene un indice de masa corporal (IMC) de: ", IMC, ". \n
Pertenece a la categoria de sobrepeso")
}else if (IMC >= 30){
  cat ("El usuario de nombre ", Datos[1,1], "tiene un indice de masa corporal (IMC) de: ", IMC, ". \n
Pertenece a la categoria de obesidad")
}
