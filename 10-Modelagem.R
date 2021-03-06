#' # Estima��o de modelos com o R
#' 
#' 
#' No centro de uma pesquisa cient�fica, � comum e
#' 
#' 
#' ## Simulando e estimando um modelo linear (OLS)
#' 
#' Um modelo do tipo linear com _N_ vari�veis expl
#' 
#' 
#' 
#' No R, a principal fun��o para a estima��o de mo
#' 
#' 
#' 
#' Para a cria��o de _y_, definimos que _x_ e o er
#' 
## ------------------------------------------------------------------------
N <- 1000
x <- rnorm(N)
my.alpha <- 0.5
my.beta <- 2
y <- my.alpha + my.beta*x + rnorm(N)

#' 
#' Podemos criar um gr�fico de dispers�o para obse
#' 
## ---- out.width='60%'----------------------------------------------------
library(ggplot2)

temp.df <- data.frame(x, y)

p <- ggplot(temp.df, aes(x = x, y = y))
p <- p + geom_point(size=0.5)

print(p)

#' 
#' Claramente, existe uma correla��o linear positi
#' 
## ------------------------------------------------------------------------
lm.df <- data.frame(x, y)

my.lm <- lm(data = lm.df, formula = y ~ x)
print(my.lm)

#' 
#' O objeto de sa�da da fun��o `lm` possui uma rep
#' 
## ------------------------------------------------------------------------
print(names(my.lm))

#' 
#' Caso quis�ssemos verificar o vetor dos coeficie
#' 
## ------------------------------------------------------------------------
my.betas <- my.lm$coefficients
print(my.betas)

#' 
#' Destaca-se que os coeficientes estimados est�o 
#' 
#' Pesquisadores mais experientes devem ter notado
#' 
## ------------------------------------------------------------------------
print(summary(my.lm))

#' 
#' 
#' Verifica-se que os coeficientes estimados possu
#' 
#' No objeto resultante da chamada da fun��o `summ
#' 
## ------------------------------------------------------------------------
my.summary <- summary(my.lm)
print(names(my.summary))

#' 
#' Essas informa��es s�o geralmente adicionadas em
#' 
#' Para a exporta��o do modelo para uma tabela, su
#' 
## ---- message=FALSE------------------------------------------------------
library(texreg)

print(screenreg(my.lm))

#' 
#' 
#' ## Simulando e estimando modelos do tipo Arima
#' 
#' O uso de modelos de s�ries temporais � bastante
#' 
#' Um exemplo simples de modelo do tipo Arima � de
#' 
#' 
#' 
#' Note que, nesse caso, tem-se um modelo do tipo 
#' 
#' Utilizando a fun��o `arima.sim` do pacote `stat
#' 
## ------------------------------------------------------------------------
my.n <- 1000
my.model <- list(ar = c(0.5), ma = c(-0.2))
my.sd <- 1

my.ts <- arima.sim(n = my.n, 
                   model = my.model , 
                   sd = my.sd)

#' 
#' Podemos criar uma figura mostrando o comportame
#' 
## ---- tidy=FALSE---------------------------------------------------------
library(ggplot2)

temp.df <- data.frame(y = unclass(my.ts), 
                      date = Sys.Date() + 1:my.n)

p <- ggplot(temp.df, aes(x = date, y = y))
p <- p + geom_line(size=0.5)

print(p)

#' 
#' O gr�fico mostra como o processo possui uma m�d
#' 
#' Para estimar um modelo Arima, utilizamos a fun�
#' 
## ------------------------------------------------------------------------
my.arima <- arima(my.ts, order = c(1,0,1))
print(my.arima)

#' 
#' Conforme pode ser visto, os par�metros estimado
#' 
## ------------------------------------------------------------------------
print(summary(my.arima))

#' 
#' 
#' A identifica��o de modelos do tipo Arima, isto 
#' 
#' Veja o exemplo a seguir, onde carregamos dados 
#' 
## ------------------------------------------------------------------------
my.df <- read.csv('data/Ibov.csv')

my.df$ret <- c(NA, my.df$price[2:nrow(my.df)]/my.df$price[1:(nrow(my.df)-1)] -1)

#' 
#' Agora, estimamos o modelo com a fun��o `auto.ar
#' 
## ------------------------------------------------------------------------
library(forecast)
my.autoarima <- auto.arima(x = my.df$ret)

print(my.autoarima)

#' 
#' Observe que o melhor modelo para os dados de re
#' 
#' 
#' ## Realizando previs�es com modelos Arima
#' 
#' A previs�o de valores de um modelo do tipo Arim
#' 
## ------------------------------------------------------------------------
print(forecast(my.autoarima, h = 5))

#' 
#' 
#' ## Simulando e estimando modelos Garch
#' 
#' Os modelos Garch surgiram na literatura ap�s os
#' 
#' Um modelo Garch � modular. T�m-se duas equa��es
#' 
#' 
#' 
#' Nesse caso, a equa��o de _y_ define o processo 
#' 
#' O R n�o possui uma fun��o nativa para simular e
#' 
#' A simula��o de um modelo do tipo Garch � efetiv
#' 
## ---- tidy=FALSE, message=FALSE------------------------------------------
library(fGarch)
my.model = list(omega=0.001, 
                alpha=0.15, 
                beta=0.8, 
                mu=0.02, 
                ar = 0.1)

spec = garchSpec(model = my.model)
print(spec)

#' 
#' Observa-se que, com o c�digo anterior, define-s
#' 
#' 
#' 
#' 
#' 
#' Para simular _1000_ observa��es desse modelo, u
#' 
## ------------------------------------------------------------------------
sim.garch = garchSim(spec, n = 1000)
class(sim.garch)

#' 
#' Podemos visualizar a s�rie temporal gerada atra
#' 
## ---- tidy=FALSE---------------------------------------------------------
temp.df <- data.frame(sim.ret = sim.garch$garch, 
                      idx=seq_along(sim.garch$garch))

library(ggplot2)
p <- ggplot(temp.df, aes(x=idx, y=sim.ret))
p <- p + geom_line()
print(p)

#' 
#' Conforme pode ser visto, o comportamento dessa 
#' 
#' 
#' ## Estimando modelos Garch
#' 
#' A estima��o dos par�metros dos modelos Garch � 
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.garchfit <- garchFit(data = sim.garch, 
						formula = ~ arma(1,0) + garch(1,1), 
						trace = FALSE)

#' 
#' Para conhecer melhor o modelo estimado, podemos
#' 
## ------------------------------------------------------------------------
print(my.garchfit)

#' 
#' Destaca-se que os par�metros estimados s�o bast
#' 
#' Assim como para os outros exemplos com modelos 
#' 
#' ## Prevendo modelos Garch
#' 
#' A previs�o do modelo Garch envolve dois element
#' 
#' No pacote `garchFit`, a previs�o da m�dia e var
#' 
## ------------------------------------------------------------------------
predict(my.garchfit, n.ahead = 3)

#' 
#' A primeira coluna do resultado anterior � a pre