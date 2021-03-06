#' # Opera��es B�sicas no R
#' 
#' 
#' Antes de come�ar a desenvolver o seu c�digo, � 
#' 
#' Nesta se��o iremos percorrer os passos iniciais
#' 
#' 
#' ## Como o R funciona?
#' 
#' A maior dificuldade que um usu�rio iniciante po
#' 
#' Enquanto esse formato de intera��o visual e mot
#' 
#' No uso do R, o ideal � mesclar o uso do mouse c
#' 
#' O R tamb�m possibilita a exporta��o de arquivos
#' 
#' No R, **tudo � um objeto, e cada tipo de objeto
#' 
#' Enquanto representamos dados como um objeto esp
#' 
#' Cada fun��o possui um pr�prio nome. Por exemplo
#' 
## ------------------------------------------------------------------------
mean(1:5, na.rm = TRUE)

#' 
#' O s�mbolo  _:_ utilizado anteriormente cria uma
#' 
#' Para entender quais s�o os argumentos de uma fu
#' 
## ------------------------------------------------------------------------
args(sd)

#' 
#' Destaca-se que `sd` � uma fun��o que calcula o 
#' 
## ------------------------------------------------------------------------
class(sd)

#'  
#' ### Formata��o de n�meros e casos espec�ficos p
#' 
#' Antes de come�ar a explicar o uso do R e RStudi
#' 
#' * **decimal:** O decimal no R � definido pelo p
#' 
#' * **caracteres latinos:** devido ao seu padr�o 
#' 
#' * **formato das datas:** as datas no R s�o form
#' 
#' ## Tipos de arquivos relacionados com o R
#' 
#' Assim como outros programas, o R possui um ecos
#' 
#' * **Arquivos com extens�o _.R_**: Representam a
#' 
#' * **Arquivos com extens�o _.RData_**: armazenam
#' 
#' * **Arquivos com extens�o _.Rmd_, _.md_ e _.Rnw
#' 
#' * **Arquivos com extens�o _.Rproj_**: cont�m ar
#' 
#' 
#' ## Explicando a tela do RStudio
#'  
#' Ap�s instalar os dois programas, R e RStudio, a
#' 
## ----RStudio1, echo=FALSE, out.width = my.out.width, fig.cap = 'A tela do RStudio'----
knitr::include_graphics('figs/RStudio1.png')

#' 
#' Observe que o RStudio automaticamente detectou 
#' 
#' Caso n�o se visualize na tela do RStudio algo c
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
#' o R n�o foi instalado corretamente. Repita os p
#' 
#' Como um primeiro exerc�cio, clique em _file_,  
#' 
## ----RStudio2, echo=FALSE, out.width = my.out.width, fig.cap = 'Explicando a tela do RStudio'----
knitr::include_graphics('figs/RStudio2.png')

#' 
#' Os principais itens/pain�is da tela do RStudio 
#' 
#' * **Editor de scripts:**  localizado no lado es
#' 
#' * **Console do R:** localizado no lado esquerdo
#' 
#' * **Environment:** localizado no lado direito e
#' 
#' * **Painel _Packages_:** mostra os pacotes inst
#' 
#' Como um exerc�cio introdut�rio, vamos inicializ
#' 
## ------------------------------------------------------------------------
x <- 1
y <- 'texto'

#' 
#' Observe agora que aparecem duas vari�veis no pa
#' 
#' Agora, vamos mostrar na tela os valores de `x`.
#' 
## ------------------------------------------------------------------------
print(x)

#' 
#' A fun��o `print` � uma das principais fun��es p
#' 
## ------------------------------------------------------------------------
print(50:100)

#' 
#' Neste caso, utilizamos o s�mbolo `:` em `50:100
#' 
#' ## Executando c�digos
#' 
#' Agora, vamos juntar todos os c�digos digitados 
#' 
## ------------------------------------------------------------------------
x <- 1
y <- 'texto'
print(x)
print(1:50)

#' 
#' Ap�s colar todos os comandos no editor, salve o
#' 
#' No RStudio existem alguns atalhos predefinidos 
#' 
#' Outro comando muito �til � a execu��o por linha
#' 
#' * **control+shift+s** executa o arquivo atual d
#' * **control+shift+enter**: executa o arquivo at
#' * **control+enter**: executa a linha selecionad
#' * **control+shift+b**: executa os c�digos do in
#' * **control+shift+e**: executa os c�digos da li
#' 
#' Sugere-se que esses atalhos sejam memorizados e
#' 
#' ### Executando c�digos em arquivos externos
#' 
#' Caso desejes rodar um c�digo salvo em um arquiv
#' 
#' Para executar o _script_ de suporte, basta cham
#' 
## ----eval=FALSE----------------------------------------------------------
## source('import-data.R')

#' 
#' Neste caso, o _script_ em `import-data.R` ser� 
#' 
#' 
#' ## Criando objetos
#' 
#' Um dos comandos mais b�sicos no R � a defini��o
#' 
## ------------------------------------------------------------------------
x <- 123

#' 
#' L�-se esse c�digo como _x � definido como 123_.
#' 
#' � poss�vel tamb�m usar o s�mbolo `=` para defin
#' 
#' O nome dos objetos � importante no R. Tirando a
#' 
#' O R executa o c�digo procurando objetos e fun��
#' 
## ---- error=TRUE---------------------------------------------------------
print(z)

#' 
#' Isso ocorre, pois o objeto `z` n�o existe no _e
#' 
#' Um ponto importante aqui � a defini��o de objet
#' 
## ------------------------------------------------------------------------
x <- 1
y <- '1'
class(x)
class(y)

#' 
#' As sa�das anteriores mostram que a vari�vel `x`
#' 
#' 
#' ## Conhecendo as vari�veis criadas
#' 
#' Ap�s a utiliza��o de diversos comandos. � desej
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
#' Outra maneira de conhecer melhor um objeto � ve
#' 
## ------------------------------------------------------------------------
print(str(1:10))

#' 
#' Essa fun��o � particularmente �til quando se es
#' 
#' 
#' ### Criando vetores de objetos
#' 
#' Nos exemplos anteriores sempre criamos objetos 
#' 
#' Um dos procedimentos mais utilizados no R � a c
#' 
#' Vetores at�micos s�o criados no R atrav�s do us
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
#' A �nica restri��o no uso do comando `c` � que t
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
#' ## Mostrando e formatando informa��es na tela
#' 
#' � poss�vel mostrar o valor de uma vari�vel na t
#' 
#' Por�m, existem outras fun��es espec�ficas para 
#' 
#' Por exemplo, caso quis�ssemos mostrar na tela o
#' 
## ------------------------------------------------------------------------
x <- 2
cat('O valor de x � igual a', x)

#' 
#' Tamb�m � poss�vel customizar a sa�da da tela at
#' 
## ------------------------------------------------------------------------
my.text <- ' Primeira linha,\n Segunda linha'
cat(my.text)

#' 
#' Observe que o uso do `print` n�o resultaria no 
#' 
## ------------------------------------------------------------------------
print(my.text)

#' 
#' Outro exemplo no uso de comandos espec�ficos pa
#' 
## ------------------------------------------------------------------------
my.text <- 'A->\t<-B'
cat(my.text)

#' 
#' Vale destacar que, na grande maioria dos casos 
#' 
#' 
#' ### Customizando a sa�da na tela
#' 
#' Parte do processo de apresenta��o de texto na t
#' 
#' A fun��o  `paste` _cola_ uma s�rie de caractere
#' 
## ------------------------------------------------------------------------
my.text.1 <- 'Eu sou um texto'
my.text.2 <- 'muito bonito'
my.text.3 <- 'e charmoso.'

cat(paste(my.text.1, my.text.2, my.text.3))

#' 
#' O resultado anterior n�o est� muito longe do qu
#' 
## ------------------------------------------------------------------------
cat(paste0(my.text.1, my.text.2, my.text.3))

#' 
#' Outra possibilidade muito �til no uso do `paste
#' 
## ------------------------------------------------------------------------
cat(paste(my.text.1, my.text.2, my.text.3, sep = ', ')) 

#' 
#' Caso tiv�ssemos um vetor at�mico com os element
#' 
#' 
## ------------------------------------------------------------------------
my.text <-c('Eu sou um texto', 'muito bonito', 'e charmoso.')
cat(paste(my.text, collapse = ', ')) 

#' 
#' Prosseguindo, o comando `format` � utilizado pa
#' 
## ------------------------------------------------------------------------
cat(1/3)

#' 
#' Caso quis�ssemos apenas dois d�gitos aparecendo
#' 
## ------------------------------------------------------------------------
cat(format(1/3, digits=2))

#' 
#' ## Conhecendo o tamanho dos objetos
#' 
#' Na pr�tica de programa��o com o R, � muito impo
#' 
#' A fun��o `length` � destinada a objetos com uma
#' 
## ------------------------------------------------------------------------
x <- c(2,3,3,4,2,1)
n <- length(x)
cat('O tamanho de x � ', n)

#' 
#' Para objetos com mais de uma dimens�o, por exem
#' 
## ------------------------------------------------------------------------
x <- matrix(1:20, nrow = 4, ncol = 5)
my.nrow <- nrow(x)
my.ncol <- ncol(x)
my.length <- length(x)
print(x)

cat('\nO n�mero de linhas em x � ', my.nrow)
cat('\nO n�mero de colunas em x � ', my.ncol)
cat('\nO n�mero de elementos em x � ', my.length)

#' 
#' J� a fun��o `dim` mostra a dimens�o do objeto, 
#' 
## ------------------------------------------------------------------------
my.dim <- dim(x)
print(my.dim)

#' 
#' Para o caso de objetos com mais de duas dimens�
#' 
## ------------------------------------------------------------------------
my.array <- array(1:9, dim = c(3,3,3))
print(my.array)

print(dim(my.array))

#' 
#' Uma observa��o importante aqui � que o uso das 
#' 
## ------------------------------------------------------------------------
my.char <- 'abcde'
print(length(my.char))

#' 
#' Isso ocorreu, pois a fun��o `length` retorna o 
#' 
## ------------------------------------------------------------------------
print(nchar(my.char))

#' 
#' Conforme foi destacado anteriormente, cada obje
#' 
#' 
#' ## Selecionando os elementos de um vetor at�mic
#' 
#' Ap�s a cria��o de um vetor at�mico de qualquer 
#' 
#' Esse processo de sele��o de _peda�os_ de um vet
#' 
## ------------------------------------------------------------------------
my.x <- c(1,5,4,3,2,7,3.5,4.3)

#' 
#' Se quis�ssemos apenas o terceiro elemento de `m
#' 
## ------------------------------------------------------------------------
elem.x <- my.x[3]
print(elem.x)

#' 
#' No caso de estarmos interessado apenas no �ltim
#' 
## ------------------------------------------------------------------------
piece.x.1 <- my.x[ (length(my.x)-1):length(my.x) ]
print(piece.x.1)

#' 
#' Uma propriedade �nica da linguagem R � que, cas
#' 
## ------------------------------------------------------------------------
my.vec <- c(1,2,3)
print(my.vec[4])

#' 
#' � importante conhecer esse comportamento do R, 
#' 
#' O uso de indexadores � muito �til quando se est
#' 
## ------------------------------------------------------------------------
piece.x.2 <- my.x[my.x>3]
print(piece.x.2) 

#' 
#' � poss�vel tamb�m indexar por mais de uma condi
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
#' A indexa��o l�gica tamb�m funciona com a intera
#' 
## ------------------------------------------------------------------------
my.x <- c(1,4,6,8,12)
my.y <- c(-2,-3,4,10,14)

my.piece.x <- my.x[ my.y > 0 ]
print(my.piece.x)

#' 
#' Olhando mais de perto o processo de indexa��o, 
#' 
## ------------------------------------------------------------------------
my.logical <- my.y > 0
print(my.logical) 
class(my.logical)

#' 
#' As propriedades e opera��es com vetores l�gicos
#' 
#' ## Limpando a mem�ria
#' 
#' Ap�s a cria��o de diversas vari�veis, o ambient
#' 
#' Por exemplo, dada uma vari�vel `x`, podemos exc
#' 
## ------------------------------------------------------------------------
x <- 1
ls()
rm('x')
ls()

#' 
#' Observe que o valor de `x` n�o est� mais dispon
#' 
#' Em situa��es pr�ticas, por�m, � desej�vel limpa
#' 
## ------------------------------------------------------------------------
rm(list=ls())

#' 
#' O termo `list` � um argumento da fun��o `rm`, o
#' 
#' ## Mostrando e mudando o diret�rio de trabalho
#' 
#' Assim como outros softwares, o **R sempre traba
#' 
#' Para mostrar o diret�rio atual de trabalho, bas
#' 
## ------------------------------------------------------------------------
my.dir <- getwd()
print(my.dir)

#' 
#' O resultado do c�digo anterior mostra a pasta o
#' 
#' A mudan�a de diret�rio de trabalho � realizada 
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

#' O erro ter� a seguinte mensagem:
#' 
#'     Error: '\M' is an unrecognized escape in ch
#'     Error in setwd(my.d) : object 'my.d' not fo
#' 
#' Portanto, ap�s copiar o endere�o, modifique tod
#' 
#' 
## ----eval=FALSE----------------------------------------------------------
## my.d <- 'C:/Minha pesquisa/'
## setwd(my.d)

#' 
#' � poss�vel tamb�m utilizar barras invertidas du
#' 
#' ## Cancelando a execu��o de um c�digo
#' 
#' Toda vez que o R estiver executando algum c�dig
#' 
#' 
#' ## Procurando ajuda
#' 
#' Uma tarefa muito comum no uso do R � procurar a
#' 
#' � poss�vel buscar ajuda utilizando tanto o pain
#' 
#' No R, toda tela de ajuda de uma fun��o � igual,
#' 
## ----ExemploAjuda, echo=FALSE, out.width = '100%', fig.cap = 'Tela de ajuda da fun��o mean'----
knitr::include_graphics('figs/ExemploAjuda.png')

#' 
#' Caso quis�ssemos procurar um termo nos arquivos
#' 
#' Como sugest�o, o ponto inicial e mais direto pa
#' 
#' Outra fonte muito importante de ajuda � a pr�pr
#' 
#' 
#' ## O uso de pacotes no R
#' 
#' Um dos grandes benef�cios do uso do R � a seu a
#' 
#' Esses pacotes podem ser acessados em diferentes
#' 
#' * [GetHFData](https://CRAN.R-project.org/packag
#' * [GetTDData](https://CRAN.R-project.org/packag
#' * [RndTexExams](https://CRAN.R-project.org/pack
#' * [BatchGetSymbols](https://CRAN.R-project.org/
#' * [predatory](https://CRAN.R-project.org/packag
#' 
#' O CRAN � o reposit�rio oficial do R e � livre. 
#' 
#' A lista completa de pacotes dispon�veis no CRAN
#' 
#' Outra fonte importante para o encontro de pacot
#' 
## ----TaskViews, echo=FALSE, out.width = '100%', fig.cap = 'Tela do Task Views'----
knitr::include_graphics("figs/TaskViews.png")

#' 
#' Ao contr�rio do CRAN, o R-Forge e o Github n�o 
#' 
#' O mais interessante nesta parte � que os pacote
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
#' Tamb�m se pode verificar a quantidade de pacote
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
#' E pronto! Ap�s a execu��o dessa linha de comand
#' 
#' 
#' ### Instalando pacotes via Github
#' 
#' Para instalar um pacote do Github, � necess�rio
#' 
## ----eval=FALSE----------------------------------------------------------
## install.packages('devtools')

#' 
#' Ap�s, utilize a fun��o `install_github` para in
#' 
## ----eval=FALSE----------------------------------------------------------
## library(devtools)
## install_github("hadley/ggplot2")

#' 
#' Observe que o nome do usu�rio do reposit�rio ta
#' 
#' ### Carregando pacotes
#' 
#' Dentro de uma rotina de pesquisa, utilizamos a 
#' 
## ----eval=FALSE----------------------------------------------------------
## library(quantmod)

#' 
#' A partir disto, todas as fun��es do pacote esta
#' 
## ------------------------------------------------------------------------
fortunes::fortune(10)

#' 
#' Nesse caso, utilizamos a fun��o `fortune` do pr
#' 
#' Outra maneira de carregar um pacote � atrav�s d
#' 
## ----eval=FALSE----------------------------------------------------------
## my.fct <- function(x){
##   require(quantmod)
## 
##   df <- getSymbols(x, auto.assign = F)
##   return(df)
## }

#' 
#' Nesse caso, a fun��o `getSymbols` faz parte do 
#' 
#' 
#' ### Atualizando pacotes
#' 
#' Ao longo do tempo, � natural que os pacotes dis
#' 
## ----RStudio-update, echo=FALSE, out.width = '100%', fig.cap = 'Atualizando pacotes no R'----
knitr::include_graphics('figs/RStudio_update.png')

#' 
#' A atualiza��o de pacotes atrav�s do _prompt_ ta
#' 
## ----eval=FALSE----------------------------------------------------------
## update.packages()

#' 
#' O comando `update.packages()` compara a vers�o 
#' 
#' ## Utilizando _Code Completion_ com a tecla _ta
#' 
#' Um recurso muito �til do RStudio � o preenchime
#' 
## ----autocomplete, echo=FALSE, out.width = '100%', fig.cap = 'Uso do autocomplete para objetos'----
knitr::include_graphics('figs/autocomplete.png')

#' 
#' Essa ferramenta tamb�m funciona para pacotes. P
#' 
## ----autocomplete-pacotes, echo=FALSE, out.width = '100%', fig.cap = 'Uso do autocomplete para pacotes'----
knitr::include_graphics('figs/autocomplete_pacotes.png')

#' 
#' Observe que uma descri��o do pacote ou objeto t
#' 
#' O uso dessa ferramenta torna-se ainda mais ben�
#' 
#' Destaca-se que o _tab_ pode ser utilizado para 
#' 
## ----autocomplete-arquivos, echo=FALSE, out.width = '100%', fig.cap = 'Uso do autocomplete para arquivos'----
knitr::include_graphics('figs/autocomplete_arquivos.png')

#' 
#' 
#' ## Interagindo com arquivos e o sistema operaci
#' 
#' Em muitas situa��es de uso do R, � necess�rio i
#' 
#' ### Listando arquivos e pastas
#' 
#' Para listar arquivos do computador, basta utili
#' 
## ------------------------------------------------------------------------
my.f <- list.files(path = "data", full.names = TRUE)
print(my.f)

#' 
#' Observe que neste diret�rio encontram-se v�rios
#' 
## ----eval=FALSE----------------------------------------------------------
## list.files(path = getwd(), recursive = T, full.names = TRUE)

#' 
#' O comando anterior ir� listar todos os arquivos
#' 
#' Para listar pastas (diret�rios) do computador, 
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
#' Os arquivos apresentados anteriormente cont�m t