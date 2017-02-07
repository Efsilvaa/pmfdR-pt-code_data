#' # Importação e exportação de dados
#' 
#' No capítulo anterior, conhecemos os principais 
#' 
#' Neste capítulo, iremos tratar da importação e e
#' 
#' 
#' ## Importação de dados via arquivos locais
#' 
#' A maneira mais fácil de importar dados para o R
#' 
#' Em todas as situações apresentadas aqui, partir
#' 
## ------------------------------------------------------------------------
my.f <- 'C:/My Data/MyData.csv'

#' 
#' Porém, manter o arquivo do _script_ de pesquisa
#' 
#' Quando os arquivos estiverem alocados em diretó
#' 
## ------------------------------------------------------------------------
my.wd <- getwd()
print(my.wd)

#' 
#' ### Importando dados de um arquivo .csv (_comma
#' 
#' 
#' Considere o arquivo de dados no formato `csv` c
#' 
#' No caso do arquivo `r my.f`, a primeira linha a
#' 
#' Para carregar os dados de arquivos em formato _
#' 
## ------------------------------------------------------------------------
my.f <- 'data/Ibov.csv'
my.df.ibov <- read.csv(my.f)

print(head(my.df.ibov))

#' 
#' Podemos verificar qual é a classe de dados do a
#' 
## ------------------------------------------------------------------------
print(sapply(my.df.ibov, class))

#' 
#' Observe que a coluna de datas (_date_) foi impo
#' 
## ------------------------------------------------------------------------
my.df.ibov <- read.csv(my.f,  colClasses = c('numeric', 'Date'))

print(str(my.df.ibov))

#' 
#' Outra maneira de fazê-lo é mudar a classe das c
#' 
## ------------------------------------------------------------------------
my.df.ibov <- read.csv(my.f)

my.df.ibov$date <- as.Date(my.df.ibov$date)
my.df.ibov$price <- as.numeric(my.df.ibov$price)
print(str(my.df.ibov))

#' 
#' Para garantir uma boa política de trabalho, sem
#' 
#' A função `read.csv` possui várias funcionalidad
#' 
#' Vale mencionar também a função `read_csv` do pa
#' 
#' 
#' ### Importando dados de um arquivo _Excel_
#' 
#' Em muitas situações de trabalho, os dados estar
#' 
#' O R não possui uma função nativa para importar 
#' 
#' Apesar de os pacotes anteriores terem objetivos
#' 
## ----eval=FALSE----------------------------------------------------------
## install.packages('readxl')

#' 
#' Imagine agora a existência de um arquivo chamad
#' 
## ------------------------------------------------------------------------
library(readxl)
my.f <- 'data/Ibov_xlsx.xlsx'
my.df <- read_excel(my.f, sheet = 'Plan1')
print(str(my.df))

#' 
#' Observe que, nesse caso, as datas já foram impo
#' 
#' 
#' ### Importando dados de um arquivo .RData
#' 
#' O R possui um formato nativo para salvar objeto
#' 
#' Para criar um novo arquivo _.RData_, utilizamos
#' 
#' 
## ------------------------------------------------------------------------
my.x <- 1:100
my.file <- 'data/temp.RData'
save(list = c('my.x'), file = my.file)

#' 
#' Podemos verificar a existência do arquivo com a
#' 
## ------------------------------------------------------------------------
print(list.files('data'))

#' 
#' Observe que o arquivo `r my.file` está disponív
#' 
## ------------------------------------------------------------------------
rm(list=ls())
load(file = 'data/temp.RData')
print(ls())

#' 
#' Observe que o objeto `my.x` foi recuperado e es
#' 
#' 
#' ### Outros formatos de arquivos
#' 
#' O uso das funções de importação de arquivos do 
#' 
#' Em alguns casos, nos deparamos com dados armaze
#' 
## ------------------------------------------------------------------------
my.f <- 'data/Ibov.csv'

my.txt <- readLines(my.f)
print(my.txt[1:5])

#' 
#' Nesse caso, importou-se todo o conteúdo do arqu
#' 
#' 
#' ## Importação de dados pela internet
#' 
#' Uma das grandes vantagens de se utilizar o R pa
#' 
#' No R, a importação de dados da internet é reali
#' 
#' 
#' ### O pacote `quantmod`
#' 
#' Para a importação de dados financeiros de ações
#' 
#' No exemplo a seguir, baixaremos dados atualizad
#' 
## ---- message=FALSE------------------------------------------------------
library(quantmod)

my.df <- getSymbols(Symbols = '^BVSP', auto.assign = F)

print(tail(my.df))

#' 
#' Observe que os dados vão até o dia `r zoo::inde
#' 
#' Para ações específicas, o encontro do símbolo c
#' 
## ------------------------------------------------------------------------
library(quantmod)

my.df <- getSymbols(Symbols = 'PETR4.SA', auto.assign = F)

print(tail(my.df))

#' 
#' Observe que, caso tivéssemos uma lista de _tick
#' 
## ------------------------------------------------------------------------
my.tickers <- c('PETR4.SA','^BVSP','^GSPC','FB')

my.env <- new.env()

getSymbols(Symbols = my.tickers, env = my.env)

print(names(my.env))

print(tail(my.env$FB))

#' 
#' Nesse caso, os dados financeiros atualizados da
#' 
#' Aos usuários interessados em baixar dados finan
#' 
## ---- message=FALSE------------------------------------------------------
library(BatchGetSymbols)

my.tickers <- c('PETR4.SA','^BVSP','^GSPC','FB')

first.date <- Sys.Date()-30
last.date <- Sys.Date()

l.out <- BatchGetSymbols(tickers = my.tickers,
                        first.date = first.date,
                        last.date = last.date)


#' 
#' O pacote não apenas baixa os dados, mas também 
#' 
## ------------------------------------------------------------------------
print(l.out$df.control)

#' 
#' Já os dados financeiros serão organizados como 
#' 
## ------------------------------------------------------------------------
print(tail(l.out$df.tickers))

#' 
#' Vale destacar também dois outros pacotes que po
#' 
#' 
#' ### O pacote `Quandl`
#' 
#' Outra grande fonte de dados financeiros na inte
#' 
#' Para utilizar o _Quandl_, o primeiro passo é cr
#' 
## ------------------------------------------------------------------------
my.api.key <- 'Asv8Ac7zuZzJSCGxynfG'

#' 
#' Destaca-se que essa chave de API é única para c
#' 
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(Quandl)
Quandl.api_key(my.api.key)
my.xts.dollar <- Quandl('BCB/10813',
						type='xts', 
                        start_date = as.Date('2000-01-01'))

print(tail(my.xts.dollar))

#' 
#' Destaco que a chave usada no exemplo não irá fu
#' 
#' Além da base de dados temporais do BCB, o `Quan
#' 
#' 
#' ### Acessando dados de páginas da internet (_We
#' 
#' Os pacotes `quantmod` e `Quandl` são muito útei
#' 
#' Como exemplo, observe o caso da página sobre [T
#' 
#' A importação desses dados para o R é fácil. O p
#' 
## ------------------------------------------------------------------------
library(XML)
my.url.part1 <- 'http://www.bmfbovespa.com.br/pt_br/produtos/'
my.url.part2 <- 'tesouro-direto/titulos-disponiveis-para-compra.htm' 
my.url <- paste0(my.url.part1, my.url.part2)
l.out <- readHTMLTable(my.url)

df.out <- l.out[[1]]
print(head(df.out))

#' 
#' Observa-se que a tabela importada é exatamente 
#' 
#' O uso de técnicas de _Webscraping_ torna-se um 
#' 
#' 
#' ## Exportação para arquivo local
#' 
#' Uma operação muito comum no uso do R é a export
#' 
#' Essa operação de exportação de dados do R geral
#' 
#' 
#' ### Exportando dados para um arquivo _.csv_
#' 
#' Para escrever um arquivo _.csv_, basta utilizar
#' 
## ------------------------------------------------------------------------
N <- 100
my.df <- data.frame(y = runif(N), z = rep('a',N))

f.out <- 'data/temp.csv'
write.csv(x = my.df, file = f.out)

#' 
#' No exemplo anterior, salvamos o `dataframe` cha
#' 
#' 
## ------------------------------------------------------------------------
my.df.import <- read.csv(f.out)
print(head(my.df.import))

#' 
#' Note que uma coluna chamada `X`, contendo o núm
#' 
## ------------------------------------------------------------------------
N <- 100
my.df <- data.frame(y = runif(N), z = rep('a',N))

f.out <- 'data/temp.csv'
write.csv(x = my.df, file = f.out, row.names=FALSE)

my.df.import <- read.csv(f.out)
print(head(my.df.import))

#' 
#' 
#' ### Exportando dados para um arquivo Excel
#' 
#' A exportação para arquivo Excel também é fácil.
#' 
## ------------------------------------------------------------------------
library(xlsx)
N <- 50
my.df <- data.frame(y = seq(1,N), z = rep('a',N))

f.out <- 'data/temp.xlsx'
write.xlsx(x = my.df, file = f.out, sheetName = "my df")

#' 
#' Caso o pacote não carregue corretamente ou a fu
#' 
#' Destaca-se que, para exportar várias informaçõe
#' 
## ------------------------------------------------------------------------
N <- 25
my.df.A <- data.frame(y = seq(1,N), z = rep('a',N))
my.df.B <- data.frame(z = rep('b',N))

f.out <- 'data/temp.xlsx'
write.xlsx(x = my.df.A, file = f.out, sheetName = "my df A")
write.xlsx(x = my.df.B, file = f.out, sheetName = "my df B", append = TRUE )

#' 
#' 
#' ### Exportando dados para um arquivo texto
#' 
#' Em algumas situações, é necessário exportar alg
#' 
## ------------------------------------------------------------------------
my.f <- 'data/temp.txt'

my.str <- paste(letters[1:5], '\n', collapse = '')
cat(my.str, file = my.f, append = FALSE)

#' 
#' No exemplo anterior, criamos um objeto de texto
#' 
## ------------------------------------------------------------------------
print(readLines(my.f))

#' 
#' 
#' ### Importação e exportação de volumosas bases 
#' 
#' Eventualmente, o usuário irá se deparar com uma
#' 
#' O principal problema prático ao se trabalhar co
#' 
#' 
#' ## O formato do dataframe (_long_ ou _wide_)
#' 
#' Após entender o processo de importação de dados
#' 
#' No **Formato wide**, as linhas da tabela são ge
#' 	
#' | refdate    | PETR4 | GGBR4 | VALE5 |
#' |------------|-------|-------|-------|
#' | 2015-01-01 | 10    | 3     | 6     |
#' | 2015-01-02 | 11    | 3.1   | 7     |
#' | 2015-01-03 | 10.5  | 3.2   | 7.5   |
#' | 2015-01-04 | 12    | 3.5   | 6     |
#' | ...        | ...   | ...   | ...   |
#' 
#' Observe que a tabela anterior possui três infor
#' 	
#' No **Formato long**, cada linha da tabela é uma
#' 	
#' | refdate    | asset.code | Price |
#' |------------|------------|-------|
#' | 2015-01-01 | PETR4      | 10    |
#' | 2015-01-01 | GGBR4      | 3     |
#' | 2015-01-01 | VALE5      | 6     |
#' | 2015-01-02 | PETR4      | 11    |
#' | 2015-01-02 | GGBR4      | 3.1   |
#' | 2015-01-02 | VALE5      | 7     |
#' | 2015-01-03 | PETR4      | 10.5  |
#' | 2015-01-03 | GGBR4      | 3.2   |
#' | 2015-01-03 | VALE5      | 7.5   |
#' | ...        | ...        | ...   |
#' 	
#' 
#' À primeira vista, essa discussão pode parecer b
#' 
#' 
#' ### Convertendo um dataframe entre formatos _lo
#' 
#' A conversão entre um tipo de formato e outro é 
#' 
## ------------------------------------------------------------------------
library(tidyr)

refdate <- as.Date('2015-01-01') + 0:3
PETR4 <- c(10, 11, 10.5, 12)
GGBR4 <- c(3, 3.1, 3.2, 3.5)
VALE5 <- c(6, 7, 7.5, 6)

my.df.wide <- data.frame(refdate, PETR4, GGBR4, VALE5)

my.df.long <- gather(data = my.df.wide,key = 'ticker',value = 'price', - refdate)

print(my.df.long)

#' 
#' Para realizar a conversão inversa, de _long_ pa
#' 
## ------------------------------------------------------------------------
my.df.wide.converted <- spread(data = my.df.long, key = 'ticker',value = 'price')
print(my.df.wide.converted)

#' 
#' No caso de conversões mais complexas, onde é ne
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(reshape2)
my.df.long <- melt(data = my.df.wide, 
				   id.vars = 'refdate', 
				   variable.name = 'ticker', 
				   value.name = 'price')
print(my.df.long)

#' 
## ------------------------------------------------------------------------
my.df.wide.converted <- dcast(data = my.df.long, 
                              formula = refdate ~ ticker, 
							  value.var = 'price')
print(my.df.wide.converted)

#' 
#' É importante conhecer essas funções ao se traba