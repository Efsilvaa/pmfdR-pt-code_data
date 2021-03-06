#' # As classes de objetos de armazenamento 
#' 
#' No cap�tulo anterior, aprendemos sobre as class
#' 
#' 
#' ## Listas
#' 
#' Uma lista � uma classe de objeto extremamente f
#' 
#' 
#' ### Criando listas
#' 
#' Uma lista pode ser criada atrav�s do comando `l
#' 
## ------------------------------------------------------------------------
my.l <- list(1, c(1,2,3), c('a', 'b'))
print(my.l)

#' 
#' Observe que at� a apresenta��o de listas com o 
#' 
#' Assim como para os demais tipos de objeto, os e
#' 
## ------------------------------------------------------------------------
my.named.l <- list(ticker = 'TICK4', 
          price = c(1,1.5,2,2.3), 
          market = 'Bovespa', 
          date.price = as.Date('2016-01-01')+0:3)
print(my.named.l)

#' 
#' Nesse caso, definir nomes para os elementos de 
#' 
#' 
#' ### Acessando os elementos de uma lista
#' 
#' Os elementos de uma lista podem ser acessados a
#' 
## ------------------------------------------------------------------------
print(my.l[[2]])
print(my.l[[3]])

#' 
#' Tamb�m � poss�vel acessar os elementos com um c
#' 
## ------------------------------------------------------------------------
my.l <- list('a', c(1,2,3), factor('a','b'))
class(my.l[[2]])
class(my.l[2])

#' 
#' Caso tentemos somar um elemento a `my.l[2]`, te
#' 
## ----error=TRUE----------------------------------------------------------
my.l[2] + 1

#' 
#' 
#' Esse erro d�-se pelo fato de que um dos objetos
#' 
## ------------------------------------------------------------------------
my.new.l <- my.l[c(1,2)]
print(my.new.l)
class(my.new.l)

#' 
#' No caso de listas com elementos nomeados, os me
#' 
#' Veja os exemplos a seguir, onde s�o apresentada
#' 
## ------------------------------------------------------------------------
print(my.named.l$ticker)
print(my.named.l$price)
print(my.named.l[['ticker']])
print(my.named.l[['price']])

#' 
#' Vale salientar que tamb�m � poss�vel acessar di
#' 
## ------------------------------------------------------------------------
my.l <- list(c(1,2,3), c('a', 'b'))
print(my.l[[1]][2])
print(my.l[[2]][1])

#' 
#' Tal opera��o � bastante �til quando se est� int
#' 
#' 
#' ### Adicionando e removendo elementos de uma li
#' 
#' A remo��o, adi��o e substitui��o de elementos d
#' 
## ------------------------------------------------------------------------
my.l <- list('a',1,3)
print(my.l)
my.l[[4]] <- c(1:5)
my.l[[2]] <- c('b')
print(my.l)

#' 
#' Isto tamb�m � poss�vel com o uso de nomes e `$`
## ------------------------------------------------------------------------
my.l <- list('a',name1=5)
print(my.l)
my.l$name2 <- 10
print(my.l)

#' 
#' Para remover elementos de uma lista, basta defi
#' 
## ------------------------------------------------------------------------
my.l <- list(text = 'b', num1 = 2, num2 = 4)
print(my.l)
my.l[[3]] <- NULL
print(my.l)
my.l$num1 <- NULL
print(my.l)

#' 
#' Outra maneira de retirar elementos de uma lista
#' 
## ------------------------------------------------------------------------
my.l <- list(a=1, b='texto')
print(my.l[[-2]])

#' 
#' Assim como no caso de vetores at�micos, essa re
#' 
## ------------------------------------------------------------------------
my.l <- list(1, 2, 3, 4)
my.l[my.l > 2] <- NULL
print(my.l)

#' 
#' Por�m, note que esse _atalho_ s� funciona porqu
#' 
#' 
#' ## Processando os elementos de uma lista
#' 
#' Um ponto importante a ser destacado a respeito 
#' 
## ------------------------------------------------------------------------
my.l.num <- list(c(1,2,3), seq(1:50), seq(-5,5, by=0.5))

#' 
#' Caso quis�ssemos calcular a m�dia de cada eleme
#' 
## ------------------------------------------------------------------------
mean.1 <- mean(my.l.num[[1]])
mean.2 <- mean(my.l.num[[2]])
mean.3 <- mean(my.l.num[[3]])
print(c(mean.1, mean.2, mean.3))

#' 
#' Uma maneira mais f�cil, elegante e inteligente 
#' 
## ------------------------------------------------------------------------
my.mean <- sapply(my.l.num, mean)
print(my.mean)

#' 
#' O uso da fun��o `sapply` � prefer�vel, por ser 
#' 
#' Essa vis�o de uma programa��o gen�rica e voltad
#' 
#' 
#' ### Outras fun��es para a manipula��o de listas
#' 
#' * **unlist** - Retorna os elementos de uma list
#' 
## ------------------------------------------------------------------------
my.named.l <- list(ticker = 'XXXX4', 
          price = c(1,1.5,2,3), 
          market = 'Bovespa')
my.unlisted <- unlist(my.named.l)
print(my.unlisted)
class(my.unlisted)

#' 	
#' * **as.list** - Converte um objeto para uma lis
#' 	
## ------------------------------------------------------------------------
my.x <- 10:13
my.x.as.list <- as.list(my.x)
print(my.x.as.list)

#' 
#' * **names** - Retorna ou define os nomes dos el
#' 	
## ------------------------------------------------------------------------
my.l <- list(value1 = 1, value2 = 2, value3 = 3)
print(names(my.l))
my.l <- list(1,2,3)
names(my.l) <- c('num1', 'num2', 'num3')
print(my.l)

#' 
#' 	
#' ## Matrizes e vetores
#' 
#' Como voc� deve se lembrar das aulas de matem�ti
#' 
#' No R, matrizes s�o objetos com duas dimens�es, 
#' 
#' Um claro exemplo do uso de matrizes em Finan�as
#' 
#' | Data       | ABEV3  | BBAS3 | BBDC3 |
#' |------------|--------|-------|-------|
#' | 2010-01-01 | 736.67 | 59.4  | 29.81 |
#' | 2010-01-04 | 764.14 | 59.8  | 30.82 |
#' | 2010-01-05 | 768.63 | 59.2  | 30.38 |
#' | 2010-01-06 | 776.47 | 59.28 | 30.20 |
#' 
#' A matriz anterior poderia ser criada da seguint
#' 
## ------------------------------------------------------------------------
data <- c(736.67, 764.14, 768.63, 776.47, 59.4, 59.8, 59.2,
      59.28, 29.81, 30.82, 30.38, 30.20)
my.mat <- matrix(data, nrow = 4, ncol = 3)
colnames(my.mat) <- c('ABEV3', 'BBAS3', 'BBDC3')
rownames(my.mat) <- c('2010-01-01', '2010-01-04', '2010-01-05', 
           '2010-01-06')
print(my.mat)

#' 
#' O c�digo anterior ficou um pouco extenso, por�m
#' 
#' No exemplo anterior, observe que, na constru��o
#' 
## ------------------------------------------------------------------------
colnames(my.mat)
rownames(my.mat)

#' 
#' No momento em que temos essa nossa matriz criad
#' 
## ----fig.align='center', echo=FALSE, out.width = '25%', include=identical(knitr:::pandoc_to(), 'epub3')----
knitr::include_graphics("eqs/PortValue.png")

#' 
#' 
#' Onde _Ni_ � o n�mero de a��es compradas em cada
#' 
## ------------------------------------------------------------------------
my.stocks <- as.matrix(c(200, 300, 100), nrow = 3)
my.port <- my.mat %*% my.stocks
print(my.port)

#' 
#' Nesse �ltimo exemplo, utilizamos o s�mbolo `%*%
#' 
#' Um ponto importante a ressaltar � que uma matri
#' 
## ------------------------------------------------------------------------
my.mat.char <- matrix(rep(c('a','b','c'), 3) , nrow = 3, ncol = 3)
print(my.mat.char)

#' 
#' Essa flexibilidade dos objetos matriciais possi
#' 
#' 
#' ### Selecionando valores de uma matriz
#' 
#' Tal como no caso dos vetores at�micos, tamb�m �
#' 
## ------------------------------------------------------------------------
my.mat <- matrix(1:9, nrow = 3)
print(my.mat)
print(my.mat[1,2])

#' 
#' Para selecionar colunas ou linhas inteiras, bas
#' 
## ------------------------------------------------------------------------
print(my.mat[ , 2])
print(my.mat[1, ])

#' 
#' Observe que a indexa��o retorna um vetor at�mic
#' 
## ------------------------------------------------------------------------
print(as.matrix(my.mat[ ,2]))
print(matrix(my.mat[1, ], nrow=1))

#' 
#' Peda�os da matriz tamb�m podem ser selecionados
#' 
## ------------------------------------------------------------------------
print(my.mat[2:3,1:2])

#' 
#' Por fim, o uso de testes l�gicos para seleciona
#' 
## ------------------------------------------------------------------------
my.mat <- matrix(1:9, nrow = 3)
print(my.mat >5)
print(my.mat[my.mat >5])

#' 
#' 
#' ### Outras fun��es �teis para a manipula��o de 
#' 
#' * **as.matrix** - Transforma dados para a class
#' 
## ------------------------------------------------------------------------
my.mat <- as.matrix(1:5)
print(my.mat)

#' 	
#' * **t** - Retorna a transposta da matriz.
#' 		
## ------------------------------------------------------------------------
my.mat <- matrix(seq(10,20, length.out = 6), nrow = 3)
print(my.mat)
print(t(my.mat))

#' 
#' * **rbind** - Retorna a jun��o (cola) vertical 
#' 
## ------------------------------------------------------------------------
my.mat.1 <- matrix(1:5, nrow = 1)
print(my.mat.1)
my.mat.2 <- matrix(10:14, nrow = 1)
print(my.mat.2)

my.rbind.mat <- rbind(my.mat.1, my.mat.2)
print(my.rbind.mat)

#' 	
#' *	**cbind** - Retorna a jun��o (cola) horizonta
#' 
## ------------------------------------------------------------------------
my.mat.1 <- matrix(1:4, nrow = 2)
print(my.mat.1)
my.mat.2 <- matrix(10:13, nrow = 2)
print(my.mat.2)

my.cbind.mat <- cbind(my.mat.1, my.mat.2)
print(my.cbind.mat)

#' 	
#' 	
#' ## `Dataframes`
#' 
#' O `dataframe` � o principal objeto utilizado na
#' 
#' Um dos pontos positivos da utiliza��o do datafr
#' 
#' 
#' ### Criando dataframes
#' 
#' Assim como para as demais classes, a cria��o de
#' 
## ------------------------------------------------------------------------
ticker <- c(rep('ABEV3',4), rep('BBAS3', 4), rep('BBDC3', 4))
date <- as.Date(rep(c('2010-01-01', '2010-01-04', '2010-01-05', '2010-01-06'), 3) )
price <- c(736.67, 764.14, 768.63, 776.47, 59.4, 59.8, 59.2, 59.28, 29.81, 30.82, 30.38, 30.20)

my.df <- data.frame(ticker, date , price)
print(my.df)

#' 
#' Observe que utilizamos a fun��o `rep` para repl
#' 
#' Vale salientar que o conte�do do dataframe cria
#' 
#' 
#' ### Acessando informa��es de um dataframe
#' 
#' Um objeto do tipo `dataframe` utiliza-se de div
#' 
#' Para descobrir os nomes das colunas de um dataf
#' 
## ------------------------------------------------------------------------
names(my.df)
colnames(my.df)

#' 
#' Para acessar uma determinada coluna, podemos ut
#' 
## ------------------------------------------------------------------------
my.ticker <- my.df$ticker	
my.prices <- my.df['price']
my.date <- my.df[ ,2] 

print(my.ticker)
print(my.prices)
print(my.date)

#' 
#' � importante apontar que, no R, um objeto da cl
#' 
## ------------------------------------------------------------------------
print(my.df[[2]])

#' 
#' Para acessar linhas e colunas espec�ficas de um
#' 
## ------------------------------------------------------------------------
print(my.df[1:5,2])

#' 
## ------------------------------------------------------------------------
print(my.df[1:5,c(1,2)])

#' 
## ------------------------------------------------------------------------
print(my.df[1:5, ])

#' 
#' Essa sele��o de colunas tamb�m pode ser realiza
#' 
## ------------------------------------------------------------------------
print(my.df[1:3, c('ticker','price')])

#' 
#' 
#' ### Modificando um dataframe
#' 
#' Para criar uma nova coluna em um dataframe, bas
#' 
## ------------------------------------------------------------------------
my.df$my.seq <- 1:nrow(my.df)
print(my.df)

#' 
#' Tamb�m � poss�vel realizar essa inser��o com o 
#' 
## ------------------------------------------------------------------------
my.df['my.seq.2'] <- seq(1,100, length.out = nrow(my.df))
my.df[[6]] <- seq(1,10, length.out = nrow(my.df))
print(my.df)

#' 
#' Observe que, no caso da coluna _6_, o nome da m
#' 
## ------------------------------------------------------------------------
colnames(my.df) <- c('ticker', 'date', 'price', 'my.seq', 'my.seq.2', 'my.seq.3')
print(my.df)

#' 
#' Como j� foi colocado anteriormente, sugiro evit
#' 
#' Para remover as colunas de um dataframe, basta 
#' 
## ------------------------------------------------------------------------
my.df$my.seq <- NULL
my.df$my.seq.2 <- NULL
my.df$V6 <- NULL
print(my.df[1:5, ])

#' 
#' Tamb�m � poss�vel remover colunas utilizando �n
#' 
## ------------------------------------------------------------------------
new.df <- my.df[ ,c(-1,-3)]
print(new.df)

#' 
#' Da mesma forma que fizemos para as matrizes, a 
#' 
## ------------------------------------------------------------------------
my.idx <- my.df$ticker == 'ABEV3'
my.df.ABEV3 <- my.df[my.idx, ]
print(my.df.ABEV3)

#' 
#' Com base neste c�digo, podemos verificar qual �
#' 
## ------------------------------------------------------------------------
my.idx <- which.max(my.df.ABEV3$price)
my.date <- my.df.ABEV3$date[my.idx]
print(my.date)

#' 
#' 
#' ### Ordenando um dataframe
#' 
#' Ap�s a cria��o ou importa��o de um dataframe, p
#' 
#' Como exemplo, considere a cria��o de um `data.f
#' 
## ------------------------------------------------------------------------
my.df <- data.frame(col1 = c(4,1,2), col2=c(1,1,3), col3= c('a','b','c'))
print(my.df)

#' 
#' A fun��o `order` retorna os �ndices relativos �
#' 
## ------------------------------------------------------------------------
idx <- order(my.df$col1)
print(idx)

#' 
#' Portanto, ao utilizar a sa�da da fun��o `order`
#' 
## ------------------------------------------------------------------------
my.df.2 <- my.df[order(my.df$col1), ]
print(my.df.2)

#' 
#' Essa opera��o de ordenamento tamb�m pode ser re
#' 
## ------------------------------------------------------------------------
my.df.3 <- my.df[order(my.df$col2, my.df$col1), ]
print(my.df.3)

#' 
#' 
#' ### Combinando e agregando dataframes
#' 
#' Em muitas situa��es, � necess�rio juntar datafr
#' 
## ------------------------------------------------------------------------
my.df.1 <- data.frame(col1 = 1:5, col2 = rep('a', 5))
my.df.2 <- data.frame(col1 = 6:10, col2 = rep('b', 5))

my.df <- rbind(my.df.1, my.df.2)
print(my.df)

#' 
#' Note que, no exemplo anterior, os nomes das col
#' 
## ------------------------------------------------------------------------
my.df.1 <- data.frame(col1 = 1:5, col2 = rep('a', 5))
my.df.2 <- data.frame(col3 = 6:10, col4 = rep('b', 5))

my.df <- cbind(my.df.1, my.df.2)
print(my.df)

#' 
#' Para casos mais complexos, onde a jun��o deve s
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.df.1 <- data.frame(date = as.Date('2016-01-01')+0:10, 
           x = 1:11)
					 
my.df.2 <- data.frame(date = as.Date('2016-01-05')+0:10,
           y = seq(20,30, length.out = 11))
my.df <- merge(my.df.1, my.df.2, by = 'date')

print(my.df)

#' 
#' Note que, nesse caso, o dataframe resultante ma
#' 
#' 
#' ### Extens�es ao dataframe
#' 
#' Como j� foi relatado em cap�tulo anterior, um d
#' 
#' Por exemplo, � muito comum trabalharmos com dad
#' 
#' Veja o exemplo a seguir, onde carregamos os dad
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(xts)

ticker <- c('ABEV3', 'BBAS3','BBDC3')

date <- as.Date(c('2010-01-01', '2010-01-04', 
                  '2010-01-05', '2010-01-06'))
price.ABEV3 <- c(736.67, 764.14, 768.63, 776.47)
price.BBAS3 <- c(59.4, 59.8, 59.2, 59.28)
price.BBDC3 <- c(29.81, 30.82, 30.38, 30.20)

my.mat <- matrix(c(price.BBDC3, price.BBAS3, price.ABEV3), 
                 nrow = length(date) )

my.xts <- xts(my.mat, order.by = date)
colnames(my.xts) <- ticker
print(my.xts)

class(my.xts)

#' 
#' O c�digo anterior pode dar a impress�o de que o
#' 
## ------------------------------------------------------------------------
N <- 500

my.mat <- matrix(c(seq(1, N), seq(N, 1)), nrow=N)

my.xts <- xts(my.mat, order.by = as.Date('2016-01-01')+1:N)

my.xts.weekly.mean <- apply.weekly(my.xts, mean)

print(head(my.xts.weekly.mean))

#' 
#' Em Finan�as, esses tipos de agrega��es com obje
#' 
#' Existem diversos outros tipos de dataframes cus
#' 
#' � importante observar que a grande maioria das 
#' 
#' 
#' ### Outras fun��es �teis para a manipula��o de 
#' 
#' * **head** - Retorna os primeiros `n` elementos
#' 
## ------------------------------------------------------------------------
my.df <- data.frame(col1 = 1:5000, col2 = rep('a', 5000))
head(my.df, 5)

#' 
#' * **tail** - Retorna os �ltimos `n` elementos d
#' 
## ------------------------------------------------------------------------
tail(my.df, 5)

#' 
#' * **complete.cases** - Retorna um vetor l�gico 
#' 
## ------------------------------------------------------------------------
my.x <- c(1:5, NA, 10)
my.y <- c(5:10, NA)
my.df <- data.frame(my.x, my.y)

print(my.df)
print(complete.cases(my.df))
print(which(!complete.cases(my.df)))

#' 
#' * **na.omit** - Retorna um dataframe sem as lin
#' 
## ------------------------------------------------------------------------
print(na.omit(my.df))

#' 
#' * **unique** - Retorna um dataframe onde todas 
#' 
## ------------------------------------------------------------------------
my.df <- data.frame(col1 = c(1,1,2,3,3,4,5), col2 = c('A','A','A','C','C','B','D'))

print(my.df)
print(unique(my.df))

#' 
#' 