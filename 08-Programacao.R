## ------------------------------------------------------------------------
knitr::opts_chunk$set(prompt = FALSE, cache = FALSE, tidy=TRUE)

#' 
#' # Programando com o R
#' 
#' Nos t�picos anteriores, aprendemos o ecossistem
#' 
#' 
#' ## Criando fun��es
#' 
#' Como j� foi destacado anteriormente, **o uso de
#' 
#' Uma fun��o sempre possui tr�s partes: as entrad
#' 
## ----eval=FALSE----------------------------------------------------------
## my.fct <- function(arg1 = 1, arg2 = 'abc', ...){
## 
## 	...
## 	
## 	return(out)
## 	
## }

#' 
#' Observa-se que a defini��o de uma fun��o � muit
#' 
#' Toda fun��o ir� retornar algum objeto com o com
#' 
#' Por exemplo, pode-se criar uma fun��o que calcu
#' 
## ------------------------------------------------------------------------
my.fct <- function(x = c(1,1,1,1)){

	 out <- sum(x)/length(x)

	return(out)

}

#' 
#' Ap�s executar o c�digo anterior, podemos testar
#' 
## ------------------------------------------------------------------------
my.mean <- my.fct(x = 1:100)
print(my.mean)

#' 
#' Caso a fun��o `my.mean` for chamada sem _input_
#' 
## ------------------------------------------------------------------------
my.mean <- my.fct()
print(my.mean)

#' 
#' Apesar de simples, o exemplo anterior nos permi
#' 
## ------------------------------------------------------------------------
my.fct <- function(x = c(1,1,1,1)){
	
	if (class(x)!='numeric'){
		stop('ERROR: Class of x is not numeric...')
	}

	out <- sum(x)/length(x)

	return(out)
}

#' 
#' 
#' No c�digo anterior, utilizamos a fun��o `class`
#' 
## ---- error=TRUE---------------------------------------------------------
my.fct(c('a','b'))

#' 
#' Outro ponto importante da fun��o criada anterio
#' 
## ------------------------------------------------------------------------
my.fct <- function(x = c(1,1,1,1)){

	if (class(x)!='numeric'){
	  stop('ERROR: Class of x is not numeric...')
	}
	
	if (any(is.na(x))){
	  warning('Warning: Found NA in x. Removing it..')
	  x <- na.omit(x)
	}	
	
	out <- sum(x)/length(x)
	
	return(out)
}

#' 
#' Testa-se a fun��o com o seguinte c�digo:
#' 
## ----warning=TRUE--------------------------------------------------------
y <- c(1,2,3, NA,1)
print(my.fct(y))

#' 
#' O uso de testes de controle das entradas de uma
#' 
#' 
#' ## Utilizando Loops (comando _for_)
#' 
#' Os _loops_ s�o os comandos mais b�sicos dentro 
#' 
#' A defini��o de um _loop_ no R segue o seguinte 
#' 
## ----eval=FALSE----------------------------------------------------------
## for (i in i.vec){
## 	...
## }

#' 
#' Para o c�digo anterior, o comando `for` indica 
#' 
## ------------------------------------------------------------------------
my.seq <- seq(-5,5)
for (i in my.seq){
	cat(paste('\nO valor de i �',i))
}

#' 
#' No exemplo anterior, criamos uma sequ�ncia de _
#' 
## ------------------------------------------------------------------------
my.char.vec <- letters[1:5]

for (i.char in my.char.vec){
	cat(paste('\nO valor de i.char �',i.char))
}

#' 
#' O mesmo � v�lido para listas.
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.l <- list(x = 1:5, 
             y = c('abc','dfg'), 
             z = factor('A','B','C','D'))

for (i.l in my.l){

	cat(paste0('\nA classe � ',class(i.l), '. '))
	cat(paste0('O n�mero de elementos � ',length(i.l),'.'))

}

#' 
#' Destaca-se que o iterador n�o precisa necessari
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.vec <- seq(1:5)
my.x <- 5
my.z <- 10

for (i in my.vec){
	my.x <- my.x + 1
	my.z <- my.z + 2
	
	cat('\nValor de i = ',i, 
		' | Valor de my.x = ', my.x, 
		' | Valor de my.z = ',my.z)
}

#' 
#' O uso de _loops_ encadeados, isto �, um _loop_ 
#' 
## ------------------------------------------------------------------------
my.mat <- matrix(1:9, nrow = 3)

for (i in seq(1,nrow(my.mat))){
	for (j in seq(1,ncol(my.mat))){
		cat(paste0('\nElemento [',i,', ',j,'] = ',my.mat[i,j]))
	}
}

#' 
#' Vamos partir agora para um exemplo mais complex
#' 
## ------------------------------------------------------------------------
n.files <- 10
pattern.name <- 'myfiles_'
out.dir <- 'many_datafiles/'

file.names <- paste0(out.dir,pattern.name, seq(1,n.files), '.csv')

for (i.file in file.names){
	temp.df <- data.frame(x = runif(100))
	write.csv(x = temp.df, file = i.file)
}

#' 
#' No exemplo anterior, utilizamos a fun��o `runif
#' 
#' Podemos checar os arquivos criados com a fun��o
#' 
## ------------------------------------------------------------------------
print(list.files(out.dir))

#' 
#' Como esperado, os arquivos criados est�o na res
#' 
## ------------------------------------------------------------------------
print(head(read.csv(file.names[1])))

#' 
#' Conforme pode ser visto, a coluna `x` do datafr
#' 
#' Outro exemplo pr�tico do uso de _loop_ � o proc
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.f <- 'data/IbovStocks_long.csv'
my.df <- read.csv(my.f,colClasses = c('numeric', 'Date','factor'))


unique.tickers <- unique(my.df$ticker)

tab.out <- data.frame()
for (i.ticker in unique.tickers){
	
	temp <- my.df[my.df$ticker==i.ticker, ]
	
	tab.out <- rbind(tab.out, data.frame(ticker = i.ticker,
	                                     mean.price = mean(temp$price)))

}

print(tab.out[1:10, ])

#' 
#' Note que, no c�digo anterior, utilizamos a fun�
#' 
#' 
#' ## Execu��es condicionais (_if/ifelse_)
#' 
#' Em alguns casos na constru��o de _scripts_ de p
#' 
## ----eval=FALSE----------------------------------------------------------
## if (cond){
## 
##   CodeIfTRUE...
## 
##   } else {
## 
##     CodeIfFALSE...
## 
## }

#' 
#' Onde `cond` � a condi��o a ser avaliada, tomand
#' 
## ------------------------------------------------------------------------
my.x <- 1:10
my.thresh <- 5

for (i in my.x){
	if (i > my.thresh){
		cat('\nValue of i', i, '- Higher than ', my.thresh)
	} else {
		cat('\nValue of i', i, '- Lower or equal than ', my.thresh)
	}
}

#' 
#' Se quisermos aplicar mais de uma condi��o l�gic
#' 
## ------------------------------------------------------------------------
my.x <- 1:10
my.thresh <- 5

for (i in my.x){
	if (i > my.thresh){
		cat('\nValue of i', i, '- Higher than ', my.thresh)
	} else if (i==my.thresh) {
		cat('\nValue of i', i, '- equal to ', my.thresh)
	} else {
		cat('\nValue of i', i, '- lower than ', my.thresh)
	}
}

#' 
#' 
#' ## Utilizando as fun��es da fam�lia `apply`
#' 
#' No R, existe uma maneira alternativa e funciona
#' 
#' 
#' ### Utilizando a fun��o `lapply`
#' 
#' A fun��o `lapply` toma como entrada uma lista e
#' 
## ------------------------------------------------------------------------
my.l <- list(1:10, 2:5, 10:-20)

my.mean.vec <- lapply(X = my.l, FUN = mean)
print(my.mean.vec)

#' 
#' O uso de `lapply` � particularmente �til quando
#' 
## ------------------------------------------------------------------------
create.rnd.file <- function(name.file){
	temp.df <- data.frame(x = runif(100))
	write.csv(x = temp.df, file = name.file)
	return(TRUE)
}

#' 
#' E utiliz�-la juntamente com a fun��o `lapply`:
#' 
## ------------------------------------------------------------------------
n.files <- 5
pattern.name <- 'myfiles_with_lapply_'
out.dir <- 'many_datafiles/'

file.names <- paste0(out.dir,pattern.name, seq(1,n.files), '.csv')


out.l <- lapply(X = file.names, FUN = create.rnd.file)
print(out.l)

#' 
## ----echo=FALSE, include=FALSE-------------------------------------------
out <- file.remove(file.names)

#' 
#' Observe que o retorno de `lapply` � uma lista. 
#' 
#' Um ponto positivo no uso das fun��es da fam�lia
#' 
#' 
#' ### Utilizando a fun��o `sapply`
#' 
#' A fun��o `sapply` funciona de forma semelhante 
#' 
## ------------------------------------------------------------------------
my.l <- list(1:10, 2:5, 10:-20)

my.mean.vec <- sapply(my.l, mean)
print(my.mean.vec)

#' 
#' O uso de `sapply` � recomendado quando se busca
#' 
#' Um aspecto importante da fun��o `sapply` � que 
#' 
## ------------------------------------------------------------------------
my.l <- list(1:10, 2:5, 10:-20)

my.fct <- function(x){
		
	x <- na.omit(x)
	
	out <- c(mean(x), sd(x))
	return(out)

}

my.vec <- sapply(my.l, my.fct)
print(my.vec)

#' 
#' Havendo mais de uma sa�da da fun��o utilizada c
#' 
#' Um uso pr�tico de `sapply` em pesquisa � a cria
#' 
## ------------------------------------------------------------------------
my.f <- 'data/IbovStocks_long.csv'
my.df <- read.csv(my.f,colClasses = c('numeric', 'Date','factor'))

my.fct <- function(x){

	x <- na.omit(x)

	out <- c(mean.price = mean(x), 
	         max.price = max(x), 
	         min.price = min(x))
	return(out)

}

my.l <- split(x = my.df$price, my.df$ticker)
my.tab <- sapply(X = my.l, FUN = my.fct)

print(head(t(my.tab)))

#'  
#' Destaca-se que, nesse caso, utilizou-se a fun��
#' 
#' 
#' ### Utilizando a fun��o `tapply`
#' 
#' A fun��o `tapply` difere das demais ao possibil
#' 
## ------------------------------------------------------------------------
my.x <- 1:150
my.factor <- factor(c(rep('C',50), rep('B',50), rep('A',50)))

my.mean.vec <- tapply(X = my.x, INDEX = my.factor, FUN = mean)
print(my.mean.vec)

#' 
#' Observa-se que o resultado � muito pr�ximo do q
#' 
#' Caso quis�ssemos utilizar a fun��o `tapply` par
#' 
## ------------------------------------------------------------------------
my.l.out <- tapply(X = my.df$price, INDEX = my.df$ticker,  FUN = my.fct)
print(my.l.out[1:5])

#' 
#' A sa�da de `tapply` � uma lista contendo os val
#' 
## ------------------------------------------------------------------------
my.tab <- do.call(what = rbind, args = my.l.out)
print(head(my.tab))

#' 
#' Essa � a primeira apari��o da fun��o `do.call`.
#' 
#' 
#' ### Utilizando a fun��o `apply`
#' 
#' A fun��o `apply` segue a l�gica das demais fun�
#' 
## ------------------------------------------------------------------------
my.mat <- matrix(1:15, nrow = 5)
print(my.mat)

sum.rows <- apply(X = my.mat, MARGIN = 1, FUN = sum)
print(sum.rows)

sum.cols <- apply(X = my.mat, MARGIN = 2, FUN = sum)
print(sum.cols)

#' 
#' No exemplo anterior, o argumento `MARGIN` defin
#' 
#' 
## ------------------------------------------------------------------------
print(apply(X = my.mat, MARGIN = 1, FUN = max))
print(apply(X = my.mat, MARGIN = 2, FUN = max))

#' 
#' 
#' ## Manipula��o de dados com o pacote `dplyr`
#' 
#' Conforme j� foi destacado anteriormente, um dos
#' 
#' O pacote `dplyr` pode ser instalado com o coman
#' 
## ----eval=FALSE----------------------------------------------------------
## install.packages('dplyr')

#' 
#' O carregamento do `dplyr` mostra diversas mensa
#' 
## ----echo=FALSE, warning=FALSE-------------------------------------------
library(dplyr)

df <- data.frame(installed.packages())
my.ver <- as.character(df$Version[df$Package=='dplyr'])
n.fct <- length(ls('package:dplyr'))

#' 
#' 
#' Em sua vers�o `r my.ver`, o pacote `dplyr` poss
#' 
#' Para ilustrar o uso das fun��es `group_by` e `s
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(dplyr)
my.f <- 'data/IbovStocks_long.csv'
my.df <- read.csv(my.f,colClasses = c('numeric', 'Date','factor'))

my.G <- group_by(my.df, ticker)

my.tab <- summarise(my.G, mean.price = mean(price), 
                          max.price = max(price), 
                          min.price = min(price))

print(my.tab)

#' 
#' Ap�s carregar os dados com a fun��o `read.csv`,
#' 
#' Depois de agruparmos os dados no objeto `my.G`,
#' 
#' O uso de `dplyr` � bastante recomendado quando 
#' 
#' Primeiro, vamos criar uma coluna chamada `my.we
#' 
## ------------------------------------------------------------------------
my.df$my.weekday <- weekdays(my.df$date)
print(head(my.df$my.weekday))

#' 
#' Prosseguimos com o agrupamento e processamento 
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(dplyr)

my.G <- group_by(my.df, ticker, my.weekday)

my.tab <- summarise(my.G, mean.price = mean(price), 
                          max.price = max(price), 
                          min.price = min(price))

print(my.tab)

#' 
#' Observe que a opera��o anterior apenas adiciono
#' 
#' Outra inova��o do pacote `dplyr` � o uso do ope
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(dplyr)

my.tab <- my.df %>% 
  group_by(ticker, my.weekday) %>% 
  summarise(mean.price = mean(price),
            max.price = max(price),
            min.price = min(price))

print(my.tab)

#' 
#' Observa-se que o c�digo mostrado � mais enxuto 
#' 
#' Nos exemplos anteriores, foram mostrados casos 