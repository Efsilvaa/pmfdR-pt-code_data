#' # Operações Básicas no R
#' 
#' 
#' Antes de começar a desenvolver o seu código, é 
#' 
#' Nesta seção iremos percorrer os passos iniciais
#' 
#' 
#' ## Como o R funciona?
#' 
#' A maior dificuldade que um usuário iniciante po
#' 
#' Enquanto esse formato de interação visual e mot
#' 
#' No uso do R, o ideal é mesclar o uso do mouse c
#' 
#' O R também possibilita a exportação de arquivos
#' 
#' No R, **tudo é um objeto, e cada tipo de objeto
#' 
#' Enquanto representamos dados como um objeto esp
#' 
#' Cada função possui um próprio nome. Por exemplo
#' 
## ------------------------------------------------------------------------
mean(1:5, na.rm = TRUE)

#' 
#' O símbolo  _:_ utilizado anteriormente cria uma
#' 
#' Para entender quais são os argumentos de uma fu
#' 
## ------------------------------------------------------------------------
args(sd)

#' 
#' Destaca-se que `sd` é uma função que calcula o 
#' 
## ------------------------------------------------------------------------
class(sd)

#'  
#' ### Formatação de números e casos específicos p
#' 
#' Antes de começar a explicar o uso do R e RStudi
#' 
#' * **decimal:** O decimal no R é definido pelo p
#' 
#' * **caracteres latinos:** devido ao seu padrão 
#' 
#' * **formato das datas:** as datas no R são form
#' 
#' ## Tipos de arquivos relacionados com o R
#' 
#' Assim como outros programas, o R possui um ecos
#' 
#' * **Arquivos com extensão _.R_**: Representam a
#' 
#' * **Arquivos com extensão _.RData_**: armazenam
#' 
#' * **Arquivos com extensão _.Rmd_, _.md_ e _.Rnw
#' 
#' * **Arquivos com extensão _.Rproj_**: contém ar
#' 
#' 
#' ## Explicando a tela do RStudio
#'  
#' Após instalar os dois programas, R e RStudio, a
#' 
## ----RStudio1, echo=FALSE, out.width = my.out.width, fig.cap = 'A tela do RStudio'----
knitr::include_graphics('figs/RStudio1.png')

#' 
#' Observe que o RStudio automaticamente detectou 
#' 
#' Caso não se visualize na tela do RStudio algo c
#' 
#' 	R version 3.3.2 (2016-10-31) -- "Sincere Pumpk
#' 	Copyright (C) 2016 The R Foundation for Statis
#' 	Platform: x86_64-w64-mingw32/x64 (64-bit)
#' 
#' 	R is free software and comes with ABSOLUTELY N
#' 	You are welcome to redistribute it under certa
#' 	Type 'license()' or 'licence()' for distributi
#' 
#' 	R is a collaborative project with many contrib
#' 	Type 'contributors()' for more information and
#' 	'citation()' on how to cite R or R packages in
#' 
#' 	Type 'demo()' for some demos, 'help()' for on-
#' 	'help.start()' for an HTML browser interface t
#' 	Type 'q()' to quit R.
#' 
#' o R não foi instalado corretamente. Repita os p
#' 
#' Como um primeiro exercício, clique em _file_,  
#' 
## ----RStudio2, echo=FALSE, out.width = my.out.width, fig.cap = 'Explicando a tela do RStudio'----
knitr::include_graphics('figs/RStudio2.png')

#' 
#' Os principais itens/painéis da tela do RStudio 
#' 
#' * **Editor de scripts:**  localizado no lado es
#' 
#' * **Console do R:** localizado no lado esquerdo
#' 
#' * **Environment:** localizado no lado direito e
#' 
#' * **Painel _Packages_:** mostra os pacotes inst
#' 
#' Como um exercício introdutório, vamos inicializ
#' 
## ------------------------------------------------------------------------
x <- 1
y <- 'texto'

#' 
#' Observe agora que aparecem duas variáveis no pa
#' 
#' Agora, vamos mostrar na tela os valores de `x`.
#' 
## ------------------------------------------------------------------------
print(x)

#' 
#' A função `print` é uma das principais funções p
#' 
## ------------------------------------------------------------------------
print(50:100)

#' 
#' Neste caso, utilizamos o símbolo `:` em `50:100
#' 
#' ## Executando códigos
#' 
#' Agora, vamos juntar todos os códigos digitados 
#' 
## ------------------------------------------------------------------------
x <- 1
y <- 'texto'
print(x)
print(1:50)

#' 
#' Após colar todos os comandos no editor, salve o
#' 
#' No RStudio existem alguns atalhos predefinidos 
#' 
#' Outro comando muito útil é a execução por linha
#' 
#' * **control+shift+s** executa o arquivo atual d
#' * **control+shift+enter**: executa o arquivo at
#' * **control+enter**: executa a linha selecionad
#' * **control+shift+b**: executa os códigos do in
#' * **control+shift+e**: executa os códigos da li
#' 
#' Sugere-se que esses atalhos sejam memorizados e
#' 
#' ### Executando códigos em arquivos externos
#' 
#' Caso desejes rodar um código salvo em um arquiv
#' 
#' Para executar o _script_ de suporte, basta cham
#' 
## ----eval=FALSE----------------------------------------------------------
## source('import-data.R')

#' 
#' Neste caso, o _script_ em `import-data.R` será 
#' 
#' 
#' ## Criando objetos
#' 
#' Um dos comandos mais básicos no R é a definição
#' 
## ------------------------------------------------------------------------
x <- 123

#' 
#' Lê-se esse código como _x é definido como 123_.
#' 
#' É possível também usar o símbolo `=` para defin
#' 
#' O nome dos objetos é importante no R. Tirando a
#' 
#' O R executa o código procurando objetos e funçõ
#' 
## ---- error=TRUE---------------------------------------------------------
print(z)

#' 
#' Isso ocorre, pois o objeto `z` não existe no _e
#' 
#' Um ponto importante aqui é a definição de objet
#' 
## ------------------------------------------------------------------------
x <- 1
y <- '1'
class(x)
class(y)

#' 
#' As saídas anteriores mostram que a variável `x`
#' 
#' 
#' ## Conhecendo as variáveis criadas
#' 
#' Após a utilização de diversos comandos. é desej
#' 
## ------------------------------------------------------------------------
x <- 1
y <- 2
z <- 3
ls()

#' 
#' Os objetos `x`, `y` e `z` foram criados e estav
#' 
## ------------------------------------------------------------------------
x
y
z

#' 
#' Destaca-se que digitar o nome do objeto na tela
#' 
#' No R, conforme mostrado, todos os objetos perte
#' 
## ------------------------------------------------------------------------
x <- 1
y <- 'a'
class(x)
class(y)

#' 
#' Outra maneira de conhecer melhor um objeto é ve
#' 
## ------------------------------------------------------------------------
print(str(1:10))

#' 
#' Essa função é particularmente útil quando se es
#' 
#' 
#' ### Criando vetores de objetos
#' 
#' Nos exemplos anteriores sempre criamos objetos 
#' 
#' Um dos procedimentos mais utilizados no R é a c
#' 
#' Vetores atômicos são criados no R através do us
#' 
## ------------------------------------------------------------------------
x <- c(1,2,3)
print(x)

#' 
#' Esse comando funciona da mesma maneira para qua
#' 
## ------------------------------------------------------------------------
y <- c('texto 1', 'texto 2', 'texto 3', 'texto 4')
print(y)

#' 
#' A única restrição no uso do comando `c` é que t
#' 
## ------------------------------------------------------------------------
x <- c(1, 2, '3')
print(x)

#' 
#' O uso do comando `class` confirma este resultad
#' 
## ------------------------------------------------------------------------
class(x)

#' 
#' 
#' ## Mostrando e formatando informações na tela
#' 
#' É possível mostrar o valor de uma variável na t
#' 
#' Porém, existem outras funções específicas para 
#' 
#' Por exemplo, caso quiséssemos mostrar na tela o
#' 
## ------------------------------------------------------------------------
x <- 2
cat('O valor de x é igual a', x)

#' 
#' Também é possível customizar a saída da tela at
#' 
## ------------------------------------------------------------------------
my.text <- ' Primeira linha,\n Segunda linha'
cat(my.text)

#' 
#' Observe que o uso do `print` não resultaria no 
#' 
## ------------------------------------------------------------------------
print(my.text)

#' 
#' Outro exemplo no uso de comandos específicos pa
#' 
## ------------------------------------------------------------------------
my.text <- 'A->\t<-B'
cat(my.text)

#' 
#' Vale destacar que, na grande maioria dos casos 
#' 
#' 
#' ### Customizando a saída na tela
#' 
#' Parte do processo de apresentação de texto na t
#' 
#' A função  `paste` _cola_ uma série de caractere
#' 
## ------------------------------------------------------------------------
my.text.1 <- 'Eu sou um texto'
my.text.2 <- 'muito bonito'
my.text.3 <- 'e charmoso.'

cat(paste(my.text.1, my.text.2, my.text.3))

#' 
#' O resultado anterior não está muito longe do qu
#' 
## ------------------------------------------------------------------------
cat(paste0(my.text.1, my.text.2, my.text.3))

#' 
#' Outra possibilidade muito útil no uso do `paste
#' 
## ------------------------------------------------------------------------
cat(paste(my.text.1, my.text.2, my.text.3, sep = ', ')) 

#' 
#' Caso tivéssemos um vetor atômico com os element
#' 
#' 
## ------------------------------------------------------------------------
my.text <-c('Eu sou um texto', 'muito bonito', 'e charmoso.')
cat(paste(my.text, collapse = ', ')) 

#' 
#' Prosseguindo, o comando `format` é utilizado pa
#' 
## ------------------------------------------------------------------------
cat(1/3)

#' 
#' Caso quiséssemos apenas dois dígitos aparecendo
#' 
## ------------------------------------------------------------------------
cat(format(1/3, digits=2))

#' 
#' ## Conhecendo o tamanho dos objetos
#' 
#' Na prática de programação com o R, é muito impo
#' 
#' A função `length` é destinada a objetos com uma
#' 
## ------------------------------------------------------------------------
x <- c(2,3,3,4,2,1)
n <- length(x)
cat('O tamanho de x é ', n)

#' 
#' Para objetos com mais de uma dimensão, por exem
#' 
## ------------------------------------------------------------------------
x <- matrix(1:20, nrow = 4, ncol = 5)
my.nrow <- nrow(x)
my.ncol <- ncol(x)
my.length <- length(x)
print(x)

cat('\nO número de linhas em x é ', my.nrow)
cat('\nO número de colunas em x é ', my.ncol)
cat('\nO número de elementos em x é ', my.length)

#' 
#' Já a função `dim` mostra a dimensão do objeto, 
#' 
## ------------------------------------------------------------------------
my.dim <- dim(x)
print(my.dim)

#' 
#' Para o caso de objetos com mais de duas dimensõ
#' 
## ------------------------------------------------------------------------
my.array <- array(1:9, dim = c(3,3,3))
print(my.array)

print(dim(my.array))

#' 
#' Uma observação importante aqui é que o uso das 
#' 
## ------------------------------------------------------------------------
my.char <- 'abcde'
print(length(my.char))

#' 
#' Isso ocorreu, pois a função `length` retorna o 
#' 
## ------------------------------------------------------------------------
print(nchar(my.char))

#' 
#' Conforme foi destacado anteriormente, cada obje
#' 
#' 
#' ## Selecionando os elementos de um vetor atômic
#' 
#' Após a criação de um vetor atômico de qualquer 
#' 
#' Esse processo de seleção de _pedaços_ de um vet
#' 
## ------------------------------------------------------------------------
my.x <- c(1,5,4,3,2,7,3.5,4.3)

#' 
#' Se quiséssemos apenas o terceiro elemento de `m
#' 
## ------------------------------------------------------------------------
elem.x <- my.x[3]
print(elem.x)

#' 
#' No caso de estarmos interessado apenas no últim
#' 
## ------------------------------------------------------------------------
piece.x.1 <- my.x[ (length(my.x)-1):length(my.x) ]
print(piece.x.1)

#' 
#' Uma propriedade única da linguagem R é que, cas
#' 
## ------------------------------------------------------------------------
my.vec <- c(1,2,3)
print(my.vec[4])

#' 
#' É importante conhecer esse comportamento do R, 
#' 
#' O uso de indexadores é muito útil quando se est
#' 
## ------------------------------------------------------------------------
piece.x.2 <- my.x[my.x>3]
print(piece.x.2) 

#' 
#' É possível também indexar por mais de uma condi
#' 
## ------------------------------------------------------------------------
piece.x.3 <- my.x[ (my.x>2) & (my.x<4) ]
print(piece.x.3)

#' 
#' Da mesma forma, havendo interesse nos itens que
#' 
## ------------------------------------------------------------------------
piece.x.4 <- my.x[ (my.x<3)|(my.x>6) ]
print(piece.x.4)

#' 
#' A indexação lógica também funciona com a intera
#' 
## ------------------------------------------------------------------------
my.x <- c(1,4,6,8,12)
my.y <- c(-2,-3,4,10,14)

my.piece.x <- my.x[ my.y > 0 ]
print(my.piece.x)

#' 
#' Olhando mais de perto o processo de indexação, 
#' 
## ------------------------------------------------------------------------
my.logical <- my.y > 0
print(my.logical) 
class(my.logical)

#' 
#' As propriedades e operações com vetores lógicos
#' 
#' ## Limpando a memória
#' 
#' Após a criação de diversas variáveis, o ambient
#' 
#' Por exemplo, dada uma variável `x`, podemos exc
#' 
## ------------------------------------------------------------------------
x <- 1
ls()
rm('x')
ls()

#' 
#' Observe que o valor de `x` não está mais dispon
#' 
#' Em situações práticas, porém, é desejável limpa
#' 
## ------------------------------------------------------------------------
rm(list=ls())

#' 
#' O termo `list` é um argumento da função `rm`, o
#' 
#' ## Mostrando e mudando o diretório de trabalho
#' 
#' Assim como outros softwares, o **R sempre traba
#' 
#' Para mostrar o diretório atual de trabalho, bas
#' 
## ------------------------------------------------------------------------
my.dir <- getwd()
print(my.dir)

#' 
#' O resultado do código anterior mostra a pasta o
#' 
#' A mudança de diretório de trabalho é realizada 
#' 
## ----eval=FALSE----------------------------------------------------------
## my.d <- 'C:/Minha pesquisa/'
## setwd(my.d)

#' 
#' Enquanto para casos simples, como o anterior, l
#' 
## ---- eval=FALSE, error=TRUE---------------------------------------------
## my.d <- 'C:\Minha pesquisa\'
## setwd(my.d)

#' O erro terá a seguinte mensagem:
#' 
#'     Error: '\M' is an unrecognized escape in ch
#'     Error in setwd(my.d) : object 'my.d' not fo
#' 
#' Portanto, após copiar o endereço, modifique tod
#' 
#' 
## ----eval=FALSE----------------------------------------------------------
## my.d <- 'C:/Minha pesquisa/'
## setwd(my.d)

#' 
#' É possível também utilizar barras invertidas du
#' 
#' ## Cancelando a execução de um código
#' 
#' Toda vez que o R estiver executando algum códig
#' 
#' 
#' ## Procurando ajuda
#' 
#' Uma tarefa muito comum no uso do R é procurar a
#' 
#' É possível buscar ajuda utilizando tanto o pain
#' 
#' No R, toda tela de ajuda de uma função é igual,
#' 
## ----ExemploAjuda, echo=FALSE, out.width = '100%', fig.cap = 'Tela de ajuda da função mean'----
knitr::include_graphics('figs/ExemploAjuda.png')

#' 
#' Caso quiséssemos procurar um termo nos arquivos
#' 
#' Como sugestão, o ponto inicial e mais direto pa
#' 
#' Outra fonte muito importante de ajuda é a própr
#' 
#' 
#' ## O uso de pacotes no R
#' 
#' Um dos grandes benefícios do uso do R é a seu a
#' 
#' Esses pacotes podem ser acessados em diferentes
#' 
#' * [GetHFData](https://CRAN.R-project.org/packag
#' * [GetTDData](https://CRAN.R-project.org/packag
#' * [RndTexExams](https://CRAN.R-project.org/pack
#' * [BatchGetSymbols](https://CRAN.R-project.org/
#' * [predatory](https://CRAN.R-project.org/packag
#' 
#' O CRAN é o repositório oficial do R e é livre. 
#' 
#' A lista completa de pacotes disponíveis no CRAN
#' 
#' Outra fonte importante para o encontro de pacot
#' 
## ----TaskViews, echo=FALSE, out.width = '100%', fig.cap = 'Tela do Task Views'----
knitr::include_graphics("figs/TaskViews.png")

#' 
#' Ao contrário do CRAN, o R-Forge e o Github não 
#' 
#' O mais interessante nesta parte é que os pacote
#' 
## ------------------------------------------------------------------------
df.cran.pkgs <- available.packages()
n.cran.packages <- nrow(df.cran.pkgs)
print(n.cran.packages)

#' 
#' Atualmente, `r Sys.time()`, existem `r n.cran.p
#' 
## ------------------------------------------------------------------------
print(df.cran.pkgs[1:3, ])

#' 
#' Resumindo, o objeto do tipo matriz `df.cran.pkg
#' 
#' Também se pode verificar a quantidade de pacote
#' 
## ------------------------------------------------------------------------
n.local.packages <- nrow(installed.packages())
print(n.local.packages)

#' 
#' Neste caso, o computador em que o livro foi esc
#' 
#' 
#' ### Instalando pacotes via CRAN
#' 
#' Para instalar um pacote, basta utilizar o coman
#'  
## ----eval=FALSE----------------------------------------------------------
## install.packages('quantmod')

#' 
#' E pronto! Após a execução dessa linha de comand
#' 
#' 
#' ### Instalando pacotes via Github
#' 
#' Para instalar um pacote do Github, é necessário
#' 
## ----eval=FALSE----------------------------------------------------------
## install.packages('devtools')

#' 
#' Após, utilize a função `install_github` para in
#' 
## ----eval=FALSE----------------------------------------------------------
## library(devtools)
## install_github("hadley/ggplot2")

#' 
#' Observe que o nome do usuário do repositório ta
#' 
#' ### Carregando pacotes
#' 
#' Dentro de uma rotina de pesquisa, utilizamos a 
#' 
## ----eval=FALSE----------------------------------------------------------
## library(quantmod)

#' 
#' A partir disto, todas as funções do pacote esta
#' 
## ------------------------------------------------------------------------
fortunes::fortune(10)

#' 
#' Nesse caso, utilizamos a função `fortune` do pr
#' 
#' Outra maneira de carregar um pacote é através d
#' 
## ----eval=FALSE----------------------------------------------------------
## my.fct <- function(x){
##   require(quantmod)
## 
##   df <- getSymbols(x, auto.assign = F)
##   return(df)
## }

#' 
#' Nesse caso, a função `getSymbols` faz parte do 
#' 
#' 
#' ### Atualizando pacotes
#' 
#' Ao longo do tempo, é natural que os pacotes dis
#' 
## ----RStudio-update, echo=FALSE, out.width = '100%', fig.cap = 'Atualizando pacotes no R'----
knitr::include_graphics('figs/RStudio_update.png')

#' 
#' A atualização de pacotes através do _prompt_ ta
#' 
## ----eval=FALSE----------------------------------------------------------
## update.packages()

#' 
#' O comando `update.packages()` compara a versão 
#' 
#' ## Utilizando _Code Completion_ com a tecla _ta
#' 
#' Um recurso muito útil do RStudio é o preenchime
#' 
## ----autocomplete, echo=FALSE, out.width = '100%', fig.cap = 'Uso do autocomplete para objetos'----
knitr::include_graphics('figs/autocomplete.png')

#' 
#' Essa ferramenta também funciona para pacotes. P
#' 
## ----autocomplete-pacotes, echo=FALSE, out.width = '100%', fig.cap = 'Uso do autocomplete para pacotes'----
knitr::include_graphics('figs/autocomplete_pacotes.png')

#' 
#' Observe que uma descrição do pacote ou objeto t
#' 
#' O uso dessa ferramenta torna-se ainda mais bené
#' 
#' Destaca-se que o _tab_ pode ser utilizado para 
#' 
## ----autocomplete-arquivos, echo=FALSE, out.width = '100%', fig.cap = 'Uso do autocomplete para arquivos'----
knitr::include_graphics('figs/autocomplete_arquivos.png')

#' 
#' 
#' ## Interagindo com arquivos e o sistema operaci
#' 
#' Em muitas situações de uso do R, é necessário i
#' 
#' ### Listando arquivos e pastas
#' 
#' Para listar arquivos do computador, basta utili
#' 
## ------------------------------------------------------------------------
my.f <- list.files(path = "data", full.names = TRUE)
print(my.f)

#' 
#' Observe que neste diretório encontram-se vários
#' 
## ----eval=FALSE----------------------------------------------------------
## list.files(path = getwd(), recursive = T, full.names = TRUE)

#' 
#' O comando anterior irá listar todos os arquivos
#' 
#' Para listar pastas (diretórios) do computador, 
#' 
## ------------------------------------------------------------------------
my.dirs <- list.dirs(recursive = F)
print(my.dirs)

#' 
#' No caso anterior, o comando listava todos os di
#' 
## ------------------------------------------------------------------------
list.files(pattern = "*.Rmd")

#' 
#' Os arquivos apresentados anteriormente contêm t