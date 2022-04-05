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

