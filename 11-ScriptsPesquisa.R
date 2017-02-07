#' # Desenvolvendo _scripts_ de pesquisa
#' 
#' 
#' Nesta seção, iremos trabalhar o tópico do desen
#' 
#' 
#' ## A estrutura de um script de pesquisa
#' 
#' Antes de começarmos os exemplos, é importante d
#' 
#' Um _script_ de pesquisa pode ser organizado em 
#' 
#' 1. **Importação dos dados**: Nesta etapa, os da
#' 
#' 2. **Limpeza e estruturação dos dados**: Os dad
#' 
#' 3. **Modelagem e teste de hipóteses**: Após a l
#' 
#' 4. **Reportando os resultados**: A última etapa
#' 
#' Cada uma das etapas anteriores pode ser estrutu
#' 
#' Caso você for trabalhar com diversos arquivos, 
#' 
#' 
#' ## A estrutura de diretórios
#' 
#' Uma estrutura de organização de diretórios tamb
#' 
#' Uma estrutura de diretórios que considero efici
#' 
#' 	/My Research about capital markets/
#' 		/data/
#' 			datafile1.csv
#' 			datafile2.csv
#' 			datafile2.csv
#' 		/fig/
#' 			MyBeautifullfig.png
#' 		/table/
#' 			Table_with_publishable_results.xlsx
#' 		/R-Fcts/
#' 			estimate_model.R
#' 			get_results.R
#' 			read_my_files.R
#' 		0-run-it-all.R
#' 		1-import-and-clean-data.R
#' 		2-run-research.R
#' 
#' Destaco que o formato anterior torna o código d
#' 
#' Indo além, um exemplo comentado para o conteúdo
#' 
## ----eval=FALSE, tidy=FALSE----------------------------------------------
## # clean up workspace
## rm(list=ls())
## 
## # close all figure windows created with x11()
## graphics.off()
## 
## # change directory
## my.d <- 'My Dir here!'
## setwd(my.d)
## 
## # load all functions
## my.R.files <- list.files(path='R-Fcts',
## 						 pattern = '*.R',
## 						 full.names=TRUE)
## sapply(my.R.files,source)
## 
## # run all steps of research
## my.R.files <- list.files(path='',
## 						 pattern = '*.R',
## 						 full.names=TRUE)
## sapply(my.R.files,source)

#' 
#' Note que, para rodar o código anterior em um ou
#' 
#' 
#' ## Exemplos de pesquisa
#' 
#' Prosseguimos com a apresentação de três exemplo
#' 
#' 
#' ### A performance de diferentes investimentos n
#' 
#' Um dos temas mais populares em Finanças é a aná
#' 
#' O interesse principal na pesquisa proposta aqui
#' 
#' * IBOV - Índice amplo do mercado brasileiro de 
#' 
#' * PETR4 - Ações preferenciais da empresa Petrob
#' 
#' * NTN-B Principal 150824 - Título de dívida púb
#' 
#' * CDI - Taxa de juros no mercado bancário, gera
#' 
#' A partir destes dados, a análise de performance
#' 
#' Podemos organizar as etapas da pesquisa como:
#' 
#' 1. Baixar os dados de preços ou retornos diário
#' 2. Agregar esses dados em um só _dataframe_.
#' 3. Processar o _dataframe_ com os preços, de fo
#' 
#' Esse _script_ de pesquisa irá necessitar a inst
#' 
## ---- eval=FALSE, tidy=FALSE---------------------------------------------
## install.packages(c('BatchGetSymbols',
## 				   'GetTDData',
## 				   'dplyr',
## 				   'Quandl',
## 				   'ggplot2'))

#' 
#' Lembre também que o acesso aos dados do pacote 
#' 
#' 
#' #### Importando dados do mercado acionário bras
#' 
#' Os dados da Bovespa podem ser baixados diretame
#' 
## ---- message=FALSE, tidy=FALSE------------------------------------------
library(BatchGetSymbols)

first.date = as.Date('2008-01-01')
last.date = as.Date('2016-12-31')
my.assets <- c('^BVSP','PETR4.SA')

my.l <- BatchGetSymbols(tickers = my.assets,
                        first.date = first.date,
                        last.date = last.date)


#' 
#' Após a importação, deve-se verificar se tudo oc
#' 
## ------------------------------------------------------------------------
print(my.l$df.control)

#' 
#' Como pode ser visto, os dados foram baixados co
#' 
## ------------------------------------------------------------------------
print(head(my.l$df.tickers))

#' 
#' Note que o _dataframe_ possui diversas informaç
#' 
## ------------------------------------------------------------------------
df.stocks <- my.l$df.tickers[, c('price.adjusted','ref.date','ticker')]
colnames(df.stocks) <- c('price','ref.date','ticker')

#' 
#' Após essa última etapa, temos em mãos um _dataf
#' 
## ------------------------------------------------------------------------
print(str(df.stocks))

#' 
#' Uma observação importante nesta etapa é que os 
#' 
#' 
#' #### Importando dados de títulos públicos (_NTN
#' 
#' Os dados de títulos do Tesouro Direto, _NTN-B P
#' 
## ---- message=FALSE, results='hide'--------------------------------------
library(GetTDData)

download.TD.data(asset.codes = 'NTN-B Principal')
df.TD <- read.TD.files(maturity = '150824')

#' 
#' Vamos verificar o formato do _dataframe_ import
#' 
## ------------------------------------------------------------------------
print(head(df.TD))

#' 
#' Note que, novamente, o _dataframe_ possui diver
#' 
## ------------------------------------------------------------------------
# remove rows before first.date and after last.date
df.TD <- df.TD[(df.TD$ref.date>=first.date)&(df.TD$ref.date<=last.date), ]

# remove  cols that don't matter to the study
df.TD$yield.bid <- NULL
df.TD$matur.date <- NULL

# modify names of cols
colnames(df.TD) <- c('ref.date','price','ticker')


#' 
#' E pronto! Verifica-se o resultado final com os 
#' 
## ------------------------------------------------------------------------
print(head(df.TD))

#' 
#' Note que a estrutura dos dados está igual ao _d
#' 
#' 
#' #### Importando dados do CDI
#' 
#' A última etapa na importação dos dados é buscar
#' 
#' 
## ---- eval=FALSE---------------------------------------------------------
## library (Quandl)
## 
## my.key <- 'YOUR_API_HERE'

#' 
#' Note que você deverá utilizar a sua própria cha
#' 
## ---- tidy=FALSE---------------------------------------------------------
Quandl.api_key(my.key)

quandl.codes <- c('BCB/4389')

df.CDI <- Quandl(quandl.codes,
                 type='raw', 
                 start_date = first.date,
				 end_date = last.date)


#' 
#' Novamente, verificamos as informações importada
#' 
## ------------------------------------------------------------------------
print(str(df.CDI))

#' 
#' Note as seguintes informações sobre os dados im
#' 
#' 1) Os valores do CDI são informados como retorn
#' 
#' 2) As datas não estão ordenadas. Essas deverão 
#' 
#' 3) Falta uma coluna com o _ticker_. Isso é o sí
#' 
#' Em primeiro lugar, modificamos os nomes das col
#' 
## ------------------------------------------------------------------------
colnames(df.CDI) <- c('ref.date','ret_year')
df.CDI$ret_day <- (1+df.CDI$ret_year/100)^(1/252) - 1

#' 
#' Após a criação dos retornos diários, ordenam-se
#' 
## ------------------------------------------------------------------------
df.CDI <- df.CDI[order(df.CDI$ref.date), ]
df.CDI$price <- cumprod(1+df.CDI$ret_day)

#' 
#' Finalizando, adiciona-se a coluna `ticker` com 
#' 
## ------------------------------------------------------------------------
df.CDI$ticker <- 'CDI'

df.CDI$ret_year <- NULL
df.CDI$ret_day <- NULL

#' 
#' Novamente, verificamos se o _dataframe_ final e
#' 
## ------------------------------------------------------------------------
print(str(df.CDI))

#' 
#' Como pode ser visto, temos as três colunas de i
#' 
#' 
#' #### Agregando os dados
#' 
#' Visto que, para cada tipo de dados, as colunas 
#' 
## ------------------------------------------------------------------------
my.df <- rbind(df.stocks, df.TD, df.CDI)

#' 
#' Verifica-se o resultado com a função `str`:
#' 
## ------------------------------------------------------------------------
print(str(my.df))

#' 
#' Essa última parte finaliza a etapa de limpeza e
#' 
#' 
#' #### Calculando retornos anuais
#' 
#' O próximo passo da pesquisa é calcular os retor
#' 
#' Observa-se que os dados importados são para pre
#' 
#' O primeiro passo é criar uma nova coluna em `my
#' 
## ------------------------------------------------------------------------
my.df$year <- format(my.df$ref.date,'%Y')

print(head(my.df$year))

#' 
#' Essa nova coluna é então utilizada para calcula
#' 
## ----tidy=FALSE----------------------------------------------------------
library(dplyr)

my.ret <- my.df %>% 
  group_by(ticker, year) %>%
  summarise(ret=price[length(price)]/price[1] -1) 

print(head(my.ret))

#' 
#' Note que o _dataframe_ resultante é exatamente 
#' 
## ------------------------------------------------------------------------
library(ggplot2)
p <- ggplot(my.ret, aes(x=as.numeric(year), y=ret, color=ticker))
p <- p + geom_line(size=1.5)
p <- p + labs(x='Ano', y = 'Retorno Anual')
p <- p + theme(legend.position="bottom")
p <- p + theme(legend.title=element_blank())
p <- p + scale_colour_grey( start = 0.2, end = 0.8)
print(p)

#' 
#' Conforme pode ser visto no gráfico, o investime
#' 
#' Para verificar o retorno total que um investido
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.l <- tapply(X = my.ret$ret, 
               INDEX = my.ret$ticker,  
               FUN = function(x) cumprod(c(x+1)))

my.l <- my.l[unique(my.ret$ticker)] 
my.ret$acum.ret <- unlist(my.l)

#' 
#' O código anterior calcula o retorno acumulado p
#' 
#' O resultado desse cálculo é apresentado a segui
#' 
## ---- tidy=FALSE---------------------------------------------------------
p <- ggplot(my.ret, aes(x=as.numeric(year), 
                        y=acum.ret, 
                        color=ticker))
p <- p + geom_line(size=2)
p <- p + labs(x='Ano', y = 'Retorno Anual Acumulado')
p <- p + theme(legend.position="bottom",legend.title=element_blank())
p <- p + scale_colour_grey( start = 0.2, end = 0.8)
print(p)

#' 
#' Como pode ser visto na figura anterior, o inves
#' 
#' Buscando uma análise mais completa sobre perfor
#' 
#' O código a seguir irá realizar três procediment
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.tab <- my.ret %>% group_by(ticker) %>%
  summarise(mean.ret = mean(ret), 
            sd.ret = sd(ret),
            sharpe = mean.ret/sd.ret)

print(my.tab)

#' 
#' Esse resultado fica mais fácil de analisar com 
#' 
## ---- tidy=FALSE---------------------------------------------------------
p <- ggplot(my.tab, aes(x=sd.ret, y=mean.ret))
p <- p + geom_point(size=3)
p <- p + annotate('text', x = my.tab$sd.ret-0.007, 
                  y = my.tab$mean.ret+0.01, 
                  label = my.tab$ticker)
p <- p + labs(x='Risco (desvio padrão)', y='Retorno Esperado')
print(p)

#' 
#' Os gráficos e tabelas anteriores confirmam o re
#' 
#' Em relação ao _script_ construído, destaca-se q
#' 
#' 
#' ### Qual o melhor modelo ARIMA para retornos fi
#' 
#' É bastante popular que se estude a possibilidad
#' 
#' O segundo exemplo de _script_ de pesquisa terá 
#' 
#' Essa questão de pesquisa é bastante geral e pod
#' 
## ---- eval=FALSE---------------------------------------------------------
## install.packages(c('BatchGetSymbols', 'forecast', 'dplyr'))

#' 
#' 
#' #### Importando os dados
#' 
#' O primeiro passo é buscar as ações que compõem 
#' 
## ---- eval=FALSE, tidy=FALSE---------------------------------------------
## library(BatchGetSymbols)
## 
## last.date <- Sys.Date()
## first.date <- last.date - 5*365
## 
## df.sp500 <- GetSP500Stocks()
## tickers <- df.sp500$tickers
## 
## l.out <- BatchGetSymbols(tickers = tickers,
## 						 first.date = first.date,
## 						 last.date = last.date)
## 
## df.sp500 <- l.out$df.tickers

#' 
#' 
#' 
#' Ressalto que o código anterior de importação de
#' 
#' Após a importação dos dados, verificamos as col
#' 
## ------------------------------------------------------------------------
print(head(df.sp500))

#' 
#' Note que, assim como no exemplo anterior, vária
#' 
## ------------------------------------------------------------------------
df.sp500 <- df.sp500[, c('ticker','price.adjusted','ref.date')]

#' 
#' O próximo passo é entender melhor qual o proces
#' 
#' Na pesquisa apresentada aqui, estamos interessa
#' 
## ------------------------------------------------------------------------
my.fct <- function(p){
  require(forecast)

  # calculate returns from prices
  ret <- p[2:length(p)]/p[1:(length(p)-1)] -1

  # estimate model
  model.out <- auto.arima(ret, max.p = 3, max.q = 3, max.d = 2,ic = 'aic')

  # get order of model
  order <- arimaorder(model.out)

  # build output
  my.str <- paste0('AR=',order[1],' D=',order[2],' MA=',order[[3]])

  return(my.str)
}

#' 
#' Na função anterior, utiliza-se o comando `requi
#' 
#' Em resumo, a função anterior funciona da seguin
#' 
## ---- cache=TRUE, tidy=FALSE---------------------------------------------
library(dplyr)

my.tab <- df.sp500 %>%
  group_by(ticker) %>%
  summarise(arima.out = my.fct(price.adjusted))

print(head(my.tab))

#' 
#' Este resultado é uma tabela que mostra, para ca
#' 
## ------------------------------------------------------------------------
my.result <- my.tab %>%
  group_by(arima.out) %>%
  summarise(my.count = n(),
            percent = n()/nrow(my.tab)) %>%
  arrange(-my.count)

print(my.result)

#' 
#' Verifica-se, na tabela anterior, que aproximada
#' 
#' Uma observação é importante, aqui. Nesta pesqui
#' 
#' 
#' ### A liquidez intradiária do mercado acionário
#' 
#' O terceiro e último exemplo de pesquisa dará co
#'  
#' Os dados utilizados nesta pesquisa correspondem
#' 
#' O primeiro passo é selecionar os ativos para ex
#' 
#' 
## ----eval=FALSE, tidy=FALSE----------------------------------------------
## library(GetHFData)
## 
## n.assets <- 6
## my.date <- as.Date('2016-09-30')
## type.mkt <- 'equity'
## 
## df.tickers <- ghfd_get_available_tickers_from_ftp(my.date = my.date,
##                                                   type.market = type.mkt)

#' 
#' 
#' Para o código anterior, a função `ghfd_get_avai
#' 
## ------------------------------------------------------------------------
print(head(df.tickers))

#' 
#' Observa-se que o _dataframe_ `df.tickers` já es
#' 
## ------------------------------------------------------------------------
my.assets <- df.tickers$tickers[1:n.assets]
print(my.assets)


#' 
#' Continuamos o exemplo empírico usando o pacote 
#' 
#' Em relação aos períodos de tempo, utilizou-se a
#' 
#' 
## ---- eval=FALSE, tidy=FALSE---------------------------------------------
## my.folder<-'PATH TO YOUR FOLDER HERE'
## setwd(my.folder)
## 
## first.time <- '10:30:00'
## last.time <- '16:30:00'
## 
## first.date <- as.Date('2016-09-12')
## last.date <- as.Date('2016-09-30')
## type.output <- 'agg'
## agg.diff <- '15 min'
## 
## my.assets <- c("ITSA4", "PETR4", "ITUB4", "BBDC4", "ABEV3", "BBSE3")
## type.mkt <- 'equity'
## 
## df.out <- ghfd_get_HF_data(my.assets = my.assets,
##                            type.market = type.mkt,
##                            first.date = first.date,
##                            last.date = last.date,
##                            first.time = first.time,
##                            last.time = last.time,
##                            type.output = type.output,
##                            agg.diff = agg.diff)

#' 
#' Vale ressaltar que o código anterior levará alg
#' 
#' 
## ------------------------------------------------------------------------
print(head(df.out))


#' 
#' Conforme descrito no manual de uso da função `g
#' 
#' Uma vez que os dados estão disponíveis no ambie
#' 
#' 
## ------------------------------------------------------------------------
p <- ggplot(df.out, aes(x =  Tradetime, y = n.trades))
p <- p + geom_boxplot() + coord_cartesian(ylim = c(0, 3000))
p <- p  + theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))
p <- p + facet_wrap(~InstrumentSymbol)
p <- p + labs(y='Number of Trades', x = 'Time of Day')
print(p)

#' 
#' A figura anterior mostra o número de transações
#' 
#' O encontro do formato em _U_ para a liquidez in