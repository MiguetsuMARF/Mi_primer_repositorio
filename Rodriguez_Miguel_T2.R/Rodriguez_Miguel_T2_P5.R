
#-----------------------------------------------------# Ejercicio 5 #---------------------------------------------------------#

## Alineamiento multiple
## Elabora un programa en R que a partir de un archivo FASTA concatenado de secuencias
## que se anexa a esta actividad haga lo siguiente:
##  (a) El n ́umero de veces que aparece la secuencia GATTACAa
##  (b) La secuencia traducida
##  (c) El alineamiento m ́ultiple por al menos dos algoritmos distintos para la secuencia de AA
##  (d) Una matriz de distancias de las secuencias
##  (e) Un  ́arbol filogen ́etico a partir de uno de los alineamiento

# Para realizar analisis con datos geneticos hace falta utilizar librerias especializadas, por lo que el primer 
# paso es instalar y cargar todos los paquetes necesarios para realizar analisis, alineamiento y graficos de 
# datos geneticos.

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")
BiocManager::install(version = "3.19")
BiocManager::install("msa")
BiocManager::install("Biostrings")
install.packages ("seqinr")
install.packages("ape")
install.packages("phangorn")
library (Biostrings)
library (msa)
library(seqinr)
library(ape)
library(phangorn)

# Posterior a esto debemos importar el archivo fasta que contiene la secuencia a analizar, se trata de un archivo
# multifasta pero la funcion readDNAStringSet sirve.
Archivo_Fasta <- readDNAStringSet("Raw_Data/FASTA.fa")

# Para poder contar un patron dentro de la secuencia usamos la funcion countPattern, pero, ya que se trata de un
# multifasta debemos usar la variante vcountPattern, de esta forma obtendremos un vector de las coincidencias
# de el patron "GATTACA".
vcountPattern("GATTACA", Archivo_Fasta)

# Se utilizo la funcion translate para llevar a cabo la traduccion de la secuencia de DNA, debido a que en ella
# hay caracteres especiales usamos la funcion especial de esta funcion "if.fuzzy.codon", la cual sirve para 
# indicar que debe de hacer cuando se presenta un codon con ambiguedades de intepretacion a partir de la 
# traduccion IUPAC. Vamos a indicar la funcion "solve", ya que queremos que, unicamente cuando se presenten 
# ambiguedades se traduzcan directamente a X, mientras que los fuzzy codons sin ambiguedades si se puedan traducir.
Fasta_traducido <- translate(Archivo_Fasta, if.fuzzy.codon="solve")

# Posteriormente vamos a realizar el alineamiento con dos de los algoritmos de la funcion msa (clustalw y omega).
# Ademas de que vamos a imprimirlos con la funcion print (show = "complete") para poder observar el resultado.
Alineamiento_1 <- msa (Fasta_traducido, method = "ClustalW", type = "protein")
print (Alineamiento_1, show = "complete")

Alineamiento_2 <- msa (Fasta_traducido, method = "ClustalOmega", type = "protein")
print (Alineamiento_2, show = "complete")

# Para realizar la matriz de distancias a partir del resultado del alineamiento (donde todas las secuencias tienen
# el mismo tamaño, ya que se agregar gaps para realizar el alineamiento) se va autilizar la funcion seqinr::dist.alignment
# Esta funcion calcula una matriz de distancias por pares usando similaridad o matriz de identidad, dependiendo de la
# secuencia. Para poder realizar esto con el resultado del alineamiento debemos de ademas realizar la conversion 
# al formato necesario para la funcion seqinr::alignment, esto mediante la funcion msaConvert.
Matriz_Distancias <- seqinr::dist.alignment (msaConvert (Alineamiento_1,"seqinr::alignment"))
Matriz_Distancias

# Y finalmente realizar los arboles filogeneticos por medio de ape y phangorn, en esta caso se realizaron estimaciones
# con el metodo neighbor-joining (por medio de la funcion ape:nj) y metodos basados en hclust como upgma o wpgma.
# Ademas al momento de realizar el grafico con la funcion plot de cada estimacion se puede especificar si queremos
# el arbol enraizado o no, cosa que puede ayudar a interpretar ciertos resultados dependiendo de la estimacion.
Arbol_nj <- ape::nj (Matriz_Distancias)
plot (Arbol_nj)
plot (Arbol_nj, "unrooted")

Arbol_upgma <- phangorn::upgma (Matriz_Distancias)
plot (Arbol_upgma)
