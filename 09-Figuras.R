#' # Criando e salvando figuras
#' 
## ----echo=FALSE----------------------------------------------------------
my.fig.height <- 3
my.fig.width <- 4

knitr::opts_chunk$set(fig.align='center',prompt = FALSE, warning=FALSE)


#' 
#' O uso de recursos gráficos em relatórios técnic
#' 
#' O R possui algumas funções nativas para a criaç
#' 
#' Assim como para outros casos, essa deficiência 
#' 
#' Neste livro, não pretendemos entrar a fundo na 
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
#' Observe, porém, que o cálculo do retorno é rela
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
#' Destaca-se que, na criação da função de cálculo
#' 
## ------------------------------------------------------------------------
idx <- complete.cases(my.df)
my.df <- my.df[idx, ]

#' 
#' Note que também foi utilizado o comando `my.l <
#' 
#' Com base nos dados em `my.df`, partimos para a 
#' 
#' 
#' ## Criando figuras com o comando `qplot`
#' 
#' Antes de apresentar os códigos para a criação d
#' 
## ---- eval=FALSE---------------------------------------------------------
## x11()
## plot(1:10)

#' 
#' O resultado na tela do RStudio deve ser algo pr
#' 
#' 
#' Destaca-se que cada chamada de `x11()` criará u
#' 
#' O pacote `ggplot2` possui uma função introdutór
#' 
#' Por exemplo, caso formos construir um gáfico de
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------

library(ggplot2)

temp.df <- my.df[my.df$ticker=='VALE5.SA', ]

qplot(data = temp.df, x = date, y = price, geom = 'line')

#' 
#' Observe que, no exemplo anterior, os nomes dos 
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
qplot(data = temp.df, x = date, y = price, geom = 'line', xlab = 'Datas', ylab = 'Preços')

#' 
#' Destaca-se que o eixo horizontal de datas na fi
#' 
#' 
#' ## Criando figuras com o comando `ggplot`
#' 
#' O uso do `qplot` é recomendado para a criação d
#' 
#' Antes de apresentarmos um exemplo de uso, é nec
#' 
#' Essa distinção entre as etapas de formação de f
#' 
#' Veja a sintaxe do código no exemplo a seguir, o
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = price))
p <- p + geom_line()
p <- p + labs(x = 'Datas', y = 'Preços')
print(p)

#' 
#' No uso da função `ggplot`, o argumento `data` é
#' 
#' Observa-se que, na primeira linha do código ant
#' 
#' Na última definição de `p`, na terceira linha d
#' 
#' O uso do comando `ggplot` mostra as suas vantag
#' 
## ------------------------------------------------------------------------
my.tickers <- c('GOAU4.SA','VALE5.SA','BBDC3.SA','NATU3.SA')
idx <- my.df$ticker %in% my.tickers
temp.df <- my.df[idx, ]

#' 
#' Nesse código, utilizamos o operador `%in%` para
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = price, color=ticker))
p <- p + geom_line()
p <- p + labs(x = 'Datas', y = 'Preços')
print(p)

#' 
#' Observe que, na função `aes`, definimos o argum
#' 
#' Diversos outros aspectos do gráfico anterior po
#' 
#' 
#' ### Criando painéis com `facet_wrap`
#' 
#' Outra possibilidade para produzir figuras de gr
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = price))
p <- p + geom_line()
p <- p + facet_wrap(facets = ~ticker)
print(p)

#' 
#' O uso de painéis é recomendado quando os dados 
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = ret))
p <- p + geom_line()
p <- p + facet_wrap(facets = ~ticker)
print(p)

#' 
#' Vale destacar que o eixo vertical dos painéis é
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = date, y = ret))
p <- p + geom_line()
p <- p + facet_wrap(facets = ~ticker, scales = 'free')
print(p)

#' 
#' ## Criando figuras estatísticas
#' 
#' Em muitos casos práticos de pesquisa, o interes
#' 
#' 
#' ### Criando histogramas
#' 
#' Um histograma pode ser facilmente construído co
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
#' Também é possível a criação de densidades a par
#' 
## ----fig.height=my.fig.height, fig.width=my.fig.width--------------------
p <- ggplot(data = temp.df, aes(x = ret, color = ticker))
p <- p + geom_density()
print(p)

#' 
#' A figura anterior permite uma comparação visual
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
p <- p + labs(x = 'Datas', y = 'Preços')

my.fig.file <- 'fig_ggplot/MyPrices.png'
ggsave(my.fig.file)

#' 
#' Pode-se verificar a criação do arquivo com o co
#' 
## ------------------------------------------------------------------------
print(list.files('fig_ggplot'))

#' 
#' Como esperado, o arquivo criado está lá, pronto