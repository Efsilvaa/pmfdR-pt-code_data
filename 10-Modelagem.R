#' # Estimação de modelos com o R
#' 
#' 
#' No centro de uma pesquisa científica, é comum e
#' 
#' 
#' ## Simulando e estimando um modelo linear (OLS)
#' 
#' Um modelo do tipo linear com _N_ variáveis expl
#' 
#' 
#' 
#' No R, a principal função para a estimação de mo
#' 
#' 
#' 
#' Para a criação de _y_, definimos que _x_ e o er
#' 
## ------------------------------------------------------------------------
N <- 1000
x <- rnorm(N)
my.alpha <- 0.5
my.beta <- 2
y <- my.alpha + my.beta*x + rnorm(N)

#' 
#' Podemos criar um gráfico de dispersão para obse
#' 
## ---- out.width='60%'----------------------------------------------------
library(ggplot2)

temp.df <- data.frame(x, y)

p <- ggplot(temp.df, aes(x = x, y = y))
p <- p + geom_point(size=0.5)

print(p)

#' 
#' Claramente, existe uma correlação linear positi
#' 
## ------------------------------------------------------------------------
lm.df <- data.frame(x, y)

my.lm <- lm(data = lm.df, formula = y ~ x)
print(my.lm)

#' 
#' O objeto de saída da função `lm` possui uma rep
#' 
## ------------------------------------------------------------------------
print(names(my.lm))

#' 
#' Caso quiséssemos verificar o vetor dos coeficie
#' 
## ------------------------------------------------------------------------
my.betas <- my.lm$coefficients
print(my.betas)

#' 
#' Destaca-se que os coeficientes estimados estão 
#' 
#' Pesquisadores mais experientes devem ter notado
#' 
## ------------------------------------------------------------------------
print(summary(my.lm))

#' 
#' 
#' Verifica-se que os coeficientes estimados possu
#' 
#' No objeto resultante da chamada da função `summ
#' 
## ------------------------------------------------------------------------
my.summary <- summary(my.lm)
print(names(my.summary))

#' 
#' Essas informações são geralmente adicionadas em
#' 
#' Para a exportação do modelo para uma tabela, su
#' 
## ---- message=FALSE------------------------------------------------------
library(texreg)

print(screenreg(my.lm))

#' 
#' 
#' ## Simulando e estimando modelos do tipo Arima
#' 
#' O uso de modelos de séries temporais é bastante
#' 
#' Um exemplo simples de modelo do tipo Arima é de
#' 
#' 
#' 
#' Note que, nesse caso, tem-se um modelo do tipo 
#' 
#' Utilizando a função `arima.sim` do pacote `stat
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
#' O gráfico mostra como o processo possui uma méd
#' 
#' Para estimar um modelo Arima, utilizamos a funç
#' 
## ------------------------------------------------------------------------
my.arima <- arima(my.ts, order = c(1,0,1))
print(my.arima)

#' 
#' Conforme pode ser visto, os parâmetros estimado
#' 
## ------------------------------------------------------------------------
print(summary(my.arima))

#' 
#' 
#' A identificação de modelos do tipo Arima, isto 
#' 
#' Veja o exemplo a seguir, onde carregamos dados 
#' 
## ------------------------------------------------------------------------
my.df <- read.csv('data/Ibov.csv')

my.df$ret <- c(NA, my.df$price[2:nrow(my.df)]/my.df$price[1:(nrow(my.df)-1)] -1)

#' 
#' Agora, estimamos o modelo com a função `auto.ar
#' 
## ------------------------------------------------------------------------
library(forecast)
my.autoarima <- auto.arima(x = my.df$ret)

print(my.autoarima)

#' 
#' Observe que o melhor modelo para os dados de re
#' 
#' 
#' ## Realizando previsões com modelos Arima
#' 
#' A previsão de valores de um modelo do tipo Arim
#' 
## ------------------------------------------------------------------------
print(forecast(my.autoarima, h = 5))

#' 
#' 
#' ## Simulando e estimando modelos Garch
#' 
#' Os modelos Garch surgiram na literatura após os
#' 
#' Um modelo Garch é modular. Têm-se duas equações
#' 
#' 
#' 
#' Nesse caso, a equação de _y_ define o processo 
#' 
#' O R não possui uma função nativa para simular e
#' 
#' A simulação de um modelo do tipo Garch é efetiv
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
#' Observa-se que, com o código anterior, define-s
#' 
#' 
#' 
#' 
#' 
#' Para simular _1000_ observações desse modelo, u
#' 
## ------------------------------------------------------------------------
sim.garch = garchSim(spec, n = 1000)
class(sim.garch)

#' 
#' Podemos visualizar a série temporal gerada atra
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
#' A estimação dos parâmetros dos modelos Garch é 
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
#' Destaca-se que os parâmetros estimados são bast
#' 
#' Assim como para os outros exemplos com modelos 
#' 
#' ## Prevendo modelos Garch
#' 
#' A previsão do modelo Garch envolve dois element
#' 
#' No pacote `garchFit`, a previsão da média e var
#' 
## ------------------------------------------------------------------------
predict(my.garchfit, n.ahead = 3)

#' 
#' A primeira coluna do resultado anterior é a pre