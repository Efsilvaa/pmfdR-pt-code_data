#' # Criando e salvando figuras
#' 
## ----echo=FALSE----------------------------------------------------------
my.fig.height <- 3
my.fig.width <- 4

knitr::opts_chunk$set(fig.align='center',prompt = FALSE, warning=FALSE)


#' 
#' O uso de recursos gr�ficos em relat�rios t�cnic
#' 
#' O R possui algumas fun��es nativas para a cria�
#' 
#' Assim como para outros casos, essa defici�ncia 
#' 
#' Neste livro, n�o pretendemos entrar a fundo na 
#' 
#' Para todos os exemplos dados aqui, iremos traba
#' 
#' Primeiro, vamos carregar os dados e conhecer as
#' 
## ------------------------------------------------------------------------
my.f <- 'data/IbovStocks_long.csv'
my.df <- read.csv(my.f,colClasses = c('numeric', 'Date','factor'))

print(head(my.df))

#' 
#' Antes de processar, vamos criar uma nova coluna
#' 
#' 
#' 
#' 
#' Observe, por�m, que o c�lculo do retorno � rela
#' 
## ------------------------------------------------------------------------
calc.ret <-function(x){

	ret <- c(NA, x[2:length(x)]/x[1:(length(x)-1)] -1)
	return(ret)
}

my.l <- tapply(X = my.df$price, 
               INDEX = my.df$ticker, 
               FUN = calc.ret)

my.l <- my.l[unique(my.df$ticker)]
my.df$ret <- unlist(my.l)
print(head(my.df))

#' 
#' Destaca-se que, na cria��o da fun��o de c�lculo
#' 
## ------------------------------------------------------------------------
idx <- complete.cases(my.df)
my.df <- my.df[idx, ]

#' 
#' Note que tamb�m foi utilizado o comando `my.l <
#' 
#' Com base nos dados em `my.df`, partimos para a 
#' 
#' 
#' ## Criando figuras com o comando `qplot`
#' 
#' Antes de apresentar os c�digos para a cria��o d
#' 
## ---- eval=FALSE---------------------------------------------------------
## x11()
## plot(1:10)

#' 
#' O resultado na tela do RStudio deve ser algo pr
#' 
#' 
#' Destaca-se que cada chamada de `x11()` criar� u
#' 
#' O pacote `ggplot2` possui uma fun��o introdut�r
#' 
#' Por exemplo, caso formos construir um g�fico de
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------

library(ggplot2)

temp.df <- my.df[my.df$ticker=='VALE5.SA', ]

qplot(data = temp.df, x = date, y = price, geom = 'line')

#' 
#' Observe que, no exemplo anterior, os nomes dos 
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
qplot(data = temp.df, x = date, y = price, geom = 'line', xlab = 'Datas', ylab = 'Pre�os')

#' 
#' Destaca-se que o eixo horizontal de datas na fi
#' 
#' 
#' ## Criando figuras com o comando `ggplot`
#' 
#' O uso do `qplot` � recomendado para a cria��o d
#' 
#' Antes de apresentarmos um exemplo de uso, � nec
#' 
#' Essa distin��o entre as etapas de forma��o de f
#' 
#' Veja a sintaxe do c�digo no exemplo a seguir, o
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = price))
p <- p + geom_line()
p <- p + labs(x = 'Datas', y = 'Pre�os')
print(p)

#' 
#' No uso da fun��o `ggplot`, o argumento `data` �
#' 
#' Observa-se que, na primeira linha do c�digo ant
#' 
#' Na �ltima defini��o de `p`, na terceira linha d
#' 
#' O uso do comando `ggplot` mostra as suas vantag
#' 
## ------------------------------------------------------------------------
my.tickers <- c('GOAU4.SA','VALE5.SA','BBDC3.SA','NATU3.SA')
idx <- my.df$ticker %in% my.tickers
temp.df <- my.df[idx, ]

#' 
#' Nesse c�digo, utilizamos o operador `%in%` para
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = price, color=ticker))
p <- p + geom_line()
p <- p + labs(x = 'Datas', y = 'Pre�os')
print(p)

#' 
#' Observe que, na fun��o `aes`, definimos o argum
#' 
#' Diversos outros aspectos do gr�fico anterior po
#' 
#' 
#' ### Criando pain�is com `facet_wrap`
#' 
#' Outra possibilidade para produzir figuras de gr
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = price))
p <- p + geom_line()
p <- p + facet_wrap(facets = ~ticker)
print(p)

#' 
#' O uso de pain�is � recomendado quando os dados 
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = ret))
p <- p + geom_line()
p <- p + facet_wrap(facets = ~ticker)
print(p)

#' 
#' Vale destacar que o eixo vertical dos pain�is �
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = ret))
p <- p + geom_line()
p <- p + facet_wrap(facets = ~ticker, scales = 'free')
print(p)

#' 
#' ## Criando figuras estat�sticas
#' 
#' Em muitos casos pr�ticos de pesquisa, o interes
#' 
#' 
#' ### Criando histogramas
#' 
#' Um histograma pode ser facilmente constru�do co
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = ret))
p <- p + geom_histogram(bins = 50)
print(p)

#' 
#' Observa-se que, nesse caso, define-se apenas um
#' 
#' Para o caso de diferentes grupos de dados, o us
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = ret))
p <- p + geom_histogram(bins = 50)
p <- p + facet_wrap(facets = ~ticker)
print(p)

#' 
#' Tamb�m � poss�vel a cria��o de densidades a par
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = ret, color = ticker))
p <- p + geom_density()
print(p)

#' 
#' A figura anterior permite uma compara��o visual
#' 
#' 
#' ### Criando figuras do tipo _Boxplot_
#' 
#' As figuras do tipo _boxplots_ servem para mostr
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = ticker, y=price))
p <- p + geom_boxplot()
print(p)

#' 
#' No exemplo anterior, bastou definir o eixo hori
#' 
#' 
#' ## Salvando figuras
#' 
#' Para salvar figuras criadas com o comando `ggpl
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width, warning=FALSE-----
p <- ggplot(data = temp.df, aes(x = date, y = price, color=ticker))
p <- p + geom_line()
p <- p + labs(x = 'Datas', y = 'Pre�os')

my.fig.file <- 'fig_ggplot/MyPrices.png'
ggsave(my.fig.file)

#' 
#' Pode-se verificar a cria��o do arquivo com o co
#' 
## ------------------------------------------------------------------------
print(list.files('fig_ggplot'))

#' 
#' Como esperado, o arquivo criado est� l�, pronto