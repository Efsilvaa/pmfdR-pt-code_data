#' # Desenvolvendo _scripts_ de pesquisa
#' 
#' 
#' Nesta se��o, iremos trabalhar o t�pico do desen
#' 
#' 
#' ## A estrutura de um script de pesquisa
#' 
#' Antes de come�armos os exemplos, � importante d
#' 
#' Um _script_ de pesquisa pode ser organizado em 
#' 
#' 1. **Importa��o dos dados**: Nesta etapa, os da
#' 
#' 2. **Limpeza e estrutura��o dos dados**: Os dad
#' 
#' 3. **Modelagem e teste de hip�teses**: Ap�s a l
#' 
#' 4. **Reportando os resultados**: A �ltima etapa
#' 
#' Cada uma das etapas anteriores pode ser estrutu
#' 
#' Caso voc� for trabalhar com diversos arquivos, 
#' 
#' 
#' ## A estrutura de diret�rios
#' 
#' Uma estrutura de organiza��o de diret�rios tamb
#' 
#' Uma estrutura de diret�rios que considero efici
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
#' Destaco que o formato anterior torna o c�digo d
#' 
#' Indo al�m, um exemplo comentado para o conte�do
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
#' Note que, para rodar o c�digo anterior em um ou
#' 
#' 
#' ## Exemplos de pesquisa
#' 
#' Prosseguimos com a apresenta��o de tr�s exemplo
#' 
#' 
#' ### A performance de diferentes investimentos n
#' 
#' Um dos temas mais populares em Finan�as � a an�
#' 
#' O interesse principal na pesquisa proposta aqui
#' 
#' * IBOV - �ndice amplo do mercado brasileiro de 
#' 
#' * PETR4 - A��es preferenciais da empresa Petrob
#' 
#' * NTN-B Principal 150824 - T�tulo de d�vida p�b
#' 
#' * CDI - Taxa de juros no mercado banc�rio, gera
#' 
#' A partir destes dados, a an�lise de performance
#' 
#' Podemos organizar as etapas da pesquisa como:
#' 
#' 1. Baixar os dados de pre�os ou retornos di�rio
#' 2. Agregar esses dados em um s� _dataframe_.
#' 3. Processar o _dataframe_ com os pre�os, de fo
#' 
#' Esse _script_ de pesquisa ir� necessitar a inst
#' 
## ---- eval=FALSE, tidy=FALSE---------------------------------------------
## install.packages(c('BatchGetSymbols',
## 				   'GetTDData',
## 				   'dplyr',
## 				   'Quandl',
## 				   'ggplot2'))

#' 
#' Lembre tamb�m que o acesso aos dados do pacote 
#' 
#' 
#' #### Importando dados do mercado acion�rio bras
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
#' Ap�s a importa��o, deve-se verificar se tudo oc
#' 
## ------------------------------------------------------------------------
print(my.l$df.control)

#' 
#' Como pode ser visto, os dados foram baixados co
#' 
## ------------------------------------------------------------------------
print(head(my.l$df.tickers))

#' 
#' Note que o _dataframe_ possui diversas informa�
#' 
## ------------------------------------------------------------------------
df.stocks <- my.l$df.tickers[, c('price.adjusted','ref.date','ticker')]
colnames(df.stocks) <- c('price','ref.date','ticker')

#' 
#' Ap�s essa �ltima etapa, temos em m�os um _dataf
#' 
## ------------------------------------------------------------------------
print(str(df.stocks))

#' 
#' Uma observa��o importante nesta etapa � que os 
#' 
#' 
#' #### Importando dados de t�tulos p�blicos (_NTN
#' 
#' Os dados de t�tulos do Tesouro Direto, _NTN-B P
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
#' Note que a estrutura dos dados est� igual ao _d
#' 
#' 
#' #### Importando dados do CDI
#' 
#' A �ltima etapa na importa��o dos dados � buscar
#' 
#' 
## ---- eval=FALSE---------------------------------------------------------
## library (Quandl)
## 
## my.key <- 'YOUR_API_HERE'

#' 
#' Note que voc� dever� utilizar a sua pr�pria cha
#' 
## ---- tidy=FALSE---------------------------------------------------------
Quandl.api_key(my.key)

quandl.codes <- c('BCB/4389')

df.CDI <- Quandl(quandl.codes,
                 type='raw', 
                 start_date = first.date,
				 end_date = last.date)


#' 
#' Novamente, verificamos as informa��es importada
#' 
## ------------------------------------------------------------------------
print(str(df.CDI))

#' 
#' Note as seguintes informa��es sobre os dados im
#' 
#' 1) Os valores do CDI s�o informados como retorn
#' 
#' 2) As datas n�o est�o ordenadas. Essas dever�o 
#' 
#' 3) Falta uma coluna com o _ticker_. Isso � o s�
#' 
#' Em primeiro lugar, modificamos os nomes das col
#' 
## ------------------------------------------------------------------------
colnames(df.CDI) <- c('ref.date','ret_year')
df.CDI$ret_day <- (1+df.CDI$ret_year/100)^(1/252) - 1

#' 
#' Ap�s a cria��o dos retornos di�rios, ordenam-se
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
#' Como pode ser visto, temos as tr�s colunas de i
#' 
#' 
#' #### Agregando os dados
#' 
#' Visto que, para cada tipo de dados, as colunas 
#' 
## ------------------------------------------------------------------------
my.df <- rbind(df.stocks, df.TD, df.CDI)

#' 
#' Verifica-se o resultado com a fun��o `str`:
#' 
## ------------------------------------------------------------------------
print(str(my.df))

#' 
#' Essa �ltima parte finaliza a etapa de limpeza e
#' 
#' 
#' #### Calculando retornos anuais
#' 
#' O pr�ximo passo da pesquisa � calcular os retor
#' 
#' Observa-se que os dados importados s�o para pre
#' 
#' O primeiro passo � criar uma nova coluna em `my
#' 
## ------------------------------------------------------------------------
my.df$year <- format(my.df$ref.date,'%Y')

print(head(my.df$year))

#' 
#' Essa nova coluna � ent�o utilizada para calcula
#' 
## ----tidy=FALSE----------------------------------------------------------
library(dplyr)

my.ret <- my.df %>% 
  group_by(ticker, year) %>%
  summarise(ret=price[length(price)]/price[1] -1) 

print(head(my.ret))

#' 
#' Note que o _dataframe_ resultante � exatamente 
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
#' Conforme pode ser visto no gr�fico, o investime
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
#' O c�digo anterior calcula o retorno acumulado p
#' 
#' O resultado desse c�lculo � apresentado a segui
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
#' Buscando uma an�lise mais completa sobre perfor
#' 
#' O c�digo a seguir ir� realizar tr�s procediment
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.tab <- my.ret %>% group_by(ticker) %>%
  summarise(mean.ret = mean(ret), 
            sd.ret = sd(ret),
            sharpe = mean.ret/sd.ret)

print(my.tab)

#' 
#' Esse resultado fica mais f�cil de analisar com 
#' 
## ---- tidy=FALSE---------------------------------------------------------
p <- ggplot(my.tab, aes(x=sd.ret, y=mean.ret))
p <- p + geom_point(size=3)
p <- p + annotate('text', x = my.tab$sd.ret-0.007, 
                  y = my.tab$mean.ret+0.01, 
                  label = my.tab$ticker)
p <- p + labs(x='Risco (desvio padr�o)', y='Retorno Esperado')
print(p)

#' 
#' Os gr�ficos e tabelas anteriores confirmam o re
#' 
#' Em rela��o ao _script_ constru�do, destaca-se q
#' 
#' 
#' ### Qual o melhor modelo ARIMA para retornos fi
#' 
#' � bastante popular que se estude a possibilidad
#' 
#' O segundo exemplo de _script_ de pesquisa ter� 
#' 
#' Essa quest�o de pesquisa � bastante geral e pod
#' 
## ---- eval=FALSE---------------------------------------------------------
## install.packages(c('BatchGetSymbols', 'forecast', 'dplyr'))

#' 
#' 
#' #### Importando os dados
#' 
#' O primeiro passo � buscar as a��es que comp�em 
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
#' Ressalto que o c�digo anterior de importa��o de
#' 
#' Ap�s a importa��o dos dados, verificamos as col
#' 
## ------------------------------------------------------------------------
print(head(df.sp500))

#' 
#' Note que, assim como no exemplo anterior, v�ria
#' 
## ------------------------------------------------------------------------
df.sp500 <- df.sp500[, c('ticker','price.adjusted','ref.date')]

#' 
#' O pr�ximo passo � entender melhor qual o proces
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
#' Na fun��o anterior, utiliza-se o comando `requi
#' 
#' Em resumo, a fun��o anterior funciona da seguin
#' 
## ---- cache=TRUE, tidy=FALSE---------------------------------------------
library(dplyr)

my.tab <- df.sp500 %>%
  group_by(ticker) %>%
  summarise(arima.out = my.fct(price.adjusted))

print(head(my.tab))

#' 
#' Este resultado � uma tabela que mostra, para ca
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
#' Uma observa��o � importante, aqui. Nesta pesqui
#' 
#' 
#' ### A liquidez intradi�ria do mercado acion�rio
#' 
#' O terceiro e �ltimo exemplo de pesquisa dar� co
#'  
#' Os dados utilizados nesta pesquisa correspondem
#' 
#' O primeiro passo � selecionar os ativos para ex
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
#' Para o c�digo anterior, a fun��o `ghfd_get_avai
#' 
## ------------------------------------------------------------------------
print(head(df.tickers))

#' 
#' Observa-se que o _dataframe_ `df.tickers` j� es
#' 
## ------------------------------------------------------------------------
my.assets <- df.tickers$tickers[1:n.assets]
print(my.assets)


#' 
#' Continuamos o exemplo emp�rico usando o pacote 
#' 
#' Em rela��o aos per�odos de tempo, utilizou-se a
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
#' Vale ressaltar que o c�digo anterior levar� alg
#' 
#' 
## ------------------------------------------------------------------------
print(head(df.out))


#' 
#' Conforme descrito no manual de uso da fun��o `g
#' 
#' Uma vez que os dados est�o dispon�veis no ambie
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
#' A figura anterior mostra o n�mero de transa��es
#' 
#' O encontro do formato em _U_ para a liquidez in