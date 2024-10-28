
#-----------------------------------------------------# Ejercicio 6 #---------------------------------------------------------#

## Jurassic Park
## A partir del archivo FASTA llamado DinoJurassic.fna. Esta secuencia la puse en formato
## fasta y es la secuencia que aparece en en libro de Michael Crichton Jurassic Park de 1993
## a) Lee el archivo en R y calcula el porcentaje de GC y de C seguidas de G
## b) Blastea la secuencia determina e interpreta tu resultado. ¿cuales serıan los organismos
## mas cercanos? ¿Tiene sentido que la secuencia sea de dinosaurios?
## c) Elabora una grafica de e-values y los organismos m ́as cercanos.
## d) Elabora un  ́arbol filogenetico con los 10 organismos m ́as cercanos
## Puedes usar esta herramineta( CABRA) o usar BLAST directamente para el segundo punto.

# Para empezar hace falta descargar y cargar las librerias necesarias para este ejercicio:
if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.19")
BiocManager::install("msa")
BiocManager::install("Biostrings")
install.packages ("seqinr")
install.packages("ape")
install.packages("ggplot2")
library (Biostrings)
library (msa)
library(seqinr)
library(ape)
library (ggplot2)

# A continuacion vamos a importar como DNAStringSet a la secuencia necesaria para este ejercicio.
Jurassic <- readDNAStringSet("Raw_Data/DinoJurassic.fna")

# Para saber el porcentaje de G y C en la secuencia vamos a utilizar la funcion alphabetFrecuency, la cual 
# nos va a dar un vector cuyos valores corresponden a cada letra. Por lo que podemos realizar una operacion
# con los elementos del vector para estimar el porcentaje total que corresponde G y C en relacion con el tamaño
# de la secuencia, que podemos obtener con la funcion width. 
Frecuencia <- alphabetFrequency (Jurassic)
porcentaje_GC <- ((Frecuencia[3]+Frecuencia[2])/width(Jurassic))*100

# Y para estimar la frecuencia de C seguida de G en la secuencia debemos utilizar la funcion countPattern, esta 
# nos va a decir la cantidad de veces que se presenta un patron especifico en la secuencia, ya que estamos 
# trabajando con un archivo que importamos como DNAStringSet debemos utilizar la funcion [[1]] para trabajar
# en la secuencia que importamos. Finalmente podemos calcular nuevamente el porcentaje que corresponde a esta 
# frecuencia dividiendola entre el tamaño total (width) y multiplicando por 100.
Frecuencia_CG <- countPattern("CG", Jurassic[[1]])
porcentaje_CG <- (Frecuencia_CG/width(Jurassic))*100

# Y finalmente para presentar los resultados podemos realizar una instruccion en cat que nos presente los porcentajes
# antes obtenidos.
cat ("El porcentaje de G y C en la secuencia DinoJurassic es de ",porcentaje_GC, "%, \n
mientras que el porcentaje de C seguidas de G es de ",porcentaje_CG, "%.")

# Al momento de realizar el blast la mayoria de las secuencias que se parearon con la secuencia corresponden a 
# vectores tanto artificiales como naturales, incluyendo vectores virales y plasmidicos. Esto no hace mucho sentido
# si pensamos en que la secuencia que tenemos es de origen fossil, pero probablemente de igual forma se complemento
# esta secuencia al momento de amplificarla en vectores, por lo que probablemente sus regiones mas conservadas son 
# las que conservo de su amplificacion.

# Todas las secuencias de los organismos cercanos tenian un valor de e-value muy bajo y similar, por lo que al 
# tomar los 10 primeros organismos obtenemos una grafica con unicamente valores de 1*10^-116.

# Para realizar la grafica vamos a hacer un data.frame que contenga los valores de evalue para cada uno de los 
# organismos, para posteriormente utilizar la funcion ggplot para realizar un boxplot donde se representa 
# la nula variacion existente entre evalues en los 10 organismos mas cercanos.
evalue <- data.frame(
  evalues <- as.numeric(c((1*10^-116), (1*10^-116),(1*10^-116),(1*10^-116), (1*10^-116),
            (1*10^-116),(1*10^-116),(1*10^-116),(1*10^-116),(1*10^-116))),
  names <- c ("pSEVA531", "pEX0","pHUsp2-cc","pBTBX-4", "pAT153",
              "pOM1","pUTTnsTet", "pAgaL4","pSEVA542", "YRp7")
)

ggplot (evalue, aes (x = evalues))+
  geom_boxplot()


# Finalmente para realizar el arbol filogenetico de las coincidencias las vamos a descargar como un archivo 
# multifasta desde blast. Posteriormente las vamos a importar aqui en R con las funcion readDNAStringSet.
Resultado_BLAST <- readDNAStringSet("Raw_Data/Blast.txt")

# Vamos a agregar la secuencia que estamos trabajando (Jurassic) para poder incluirla en el arbol filogenetico.
# Esto mediante la funcion DNAStringSet.
Secuencias_totales <- DNAStringSet(c (Resultado_BLAST, Jurassic))

# A continuacion vamos a traducir las secuencias por medio de la funcion translate y a realizar el alineamiento
# multiple mediante la funcion msa, con el algoritmo ClustalW.

traduccion_secuencias <- translate(Secuencias_totales)
alineamiento_jurasico <- msa(traduccion_secuencias, method = "ClustalW")
alineamiento_jurasico

# Posteriormente vamos a utilizar la funcion dist.alignment del paquete seqinr para realizar la matriz de distancias
# entre las secuencias alineadas, cambiando el formato del alineamiento mediante la funcion msaConvert.
Matriz_jurasica <- seqinr::dist.alignment (msaConvert (alineamiento_jurasico,"seqinr::alignment"))
Matriz_jurasica

# y finalmente vamos a utilizar la funcion nj del paquete ape para realizar una estimacion mediante el metodo 
# neighbor-joining de arbol filogenetico.
Arbol_jurasico <- ape::nj (Matriz_jurasica)
plot (Arbol_jurasico)
