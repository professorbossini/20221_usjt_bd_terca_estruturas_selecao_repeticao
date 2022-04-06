#1. Abra o arquivo cancer.txt como um data frame.
arq <- read.table('cancer.txt', header=T)
print(arq)

#2. Usando um loop for, faça o histograma das variáveis LDH, ALB e N. Use cores diferentes.
campos <- c('LDH','ALB', 'N');campos
titulos <- c('Lactate Dehydrogenase (LDH)', 'Albumina(ALB)', 'Nitrogênio na Uréia(N)');titulos
cores <- c ('blue', 'green', 'red');cores
n <- 1:length(campos)
n
?par
#mfrow = c(1, 3) da esquerda para a direita, de cima para baixo. 1 linha e três colunas
#mfcol = c(1, 3) de cima para baixo, da esquerda para a direita. 1 linha e três colunas

par(mfrow=c(1, 3))

arq['LDH']
arq[['LDH']]
arq[[campos[1]]]
arq[[campos[2]]]
arq[[campos[3]]]

for (i in n){
  hist(arq[[campos[i]]], main=titulos[i], col=cores[i], xlab=campos[i], ylab="Frequência")
}

par(mfrow=c(1,1))

#3. Qual grupo de diagnósticos tem os pacientes mais novos? Descubra, usando desvio condicional, qual a mediana e escreva o grupo e a mediana.

arq

arq$Grupo

arq$Grupo==1

arq[TRUE, 'Idade']
T 25
T 37
T 22



arq[c(T, F), 'Idade']

arq[arq$Grupo==1, 'Idade']

#mediana dos falsos negativos

idade_fn <- median (arq[arq$Grupo==1, 'Idade']);idade_fn
idade_n <- median (arq[arq$Grupo==2, 'Idade']); idade_n
idade_p <- median (arq[arq$Grupo==3, 'Idade']);idade_p
idade_fp <- median(arq[arq$Grupo==4, 'Idade']);idade_fp

modelo <- 'Os mais novos são do grupo %s. Mediana %d\n'
sprintf(modelo, 'N', idade_n)

cat(sprintf(modelo, 'N', idade_n))

a <- ifelse (2 < 1, c(1, 2), c(3,4));a;
a <- ifelse (c(1 < 2, 2 < 1), c(1, 2), c(3, 4));a


frame <- data.frame(nome=c('FN', 'N', 'P', 'FP'), valor=c(idade_fn, idade_n, idade_p, idade_fp));frame

frame <- frame[order(frame$valor),];frame;

?paste

print (paste("Os mais novos são do grupo: ", frame[1, 1], ". Mediana: ", frame[1, 2]))
