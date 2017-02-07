#' # As classes básicas de objetos
#' 
#' **No R, tudo é um objeto**. A maioria dos coman
#' 
#' Uma distinção relevante aqui é a diferença entr
#' 
#' Uma maneira mais simples de organizar os nossos
#' 
#' 
#' ## Valores numéricos
#' 
#' Essa é uma das classes mais utilizadas em progr
#' 
#' 
#' ### Criando e manipulando vetores de valores nu
#' 
#' A criação e manipulação de valores numéricos é 
#' 
## ------------------------------------------------------------------------
x <- 1:5
y <- 2:6
print(x+y)
print(x*y)
print(x/y)
print(x^y)

#' 
#' Um diferencial do R em relação a outras linguag
#' 
## ------------------------------------------------------------------------
x <- c(1, 2, 3, 4)
y <- c(2, 1)
print(x +y)

#' 
#' Caso tentemos operar com vetores em que o taman
#' 
## ----warning=TRUE, error=TRUE--------------------------------------------
x <- c(1, 2, 3, 4)
y <- c(1, 2, 3)
print(x +y)

#' 
#' Os elementos de um vetor numérico também podem 
#' 
## ------------------------------------------------------------------------
x <- c(item1 = 10, item2 = 14, item3 = 9, item4 = 2)
print(x)

#' 
#' Para nomear os elementos após a criação, podemo
#' 
## ------------------------------------------------------------------------
x <- c(10, 14, 9, 2)
names(x) <- c('item1', 'item2', 'item3', 'item4')
print(x)

#' 
#' Observe que o uso de `names` para definir nomes
#' 
#' Vetores numéricos vazios, mas com um número de 
#' 
## ------------------------------------------------------------------------
my.x <- numeric(length = 10)

#' 
#' Observe que, nesse caso, os valores de `my.x` s
#' 
## ------------------------------------------------------------------------
print(my.x)

#' 
#' 
#' ### Criando sequências de valores
#' 
#' Para criar sequências de valores numéricos, exi
#' 
#' Porém, o uso do operador `:` limita as possibil
#' 
## ------------------------------------------------------------------------
my.seq <- seq(from = -10, to = 10, by = 2)
print(my.seq)

#' 
#' Outro atributo interessante da função `seq` é a
#' 
## ------------------------------------------------------------------------
my.seq <- seq(from = 0, to = 10, length.out = 20)
print(my.seq)

#' 
#' No caso anterior, o tamanho final do vetor foi 
#' 
#' 
#' ### Criando vetores com elementos repetidos
#' 
#' Outra função interessante é a que cria vetores 
#' 
## ------------------------------------------------------------------------
my.x <- rep(x = c(1, 2), times = 3)
print(my.x)

#' 
#' 
#' ### Criando vetores com números aleatórios
#' 
#' Em muitas situações em análise de dados, é nece
#' 
#' A função `rnorm` gera números aleatórios da dis
#' 
## ------------------------------------------------------------------------
my.rnd.vec <- rnorm(n = 10, mean = 0, sd = 1)
print(my.rnd.vec)

#' 
#' No caso anterior, geramos dez números aleatório
#' 
#' Já a função `runif` gera valores aleatórios da 
#' 
## ------------------------------------------------------------------------
my.rnd.vec <- runif(n = 10, min = -5, max = 5)
print(my.rnd.vec)

#' 
#' Observe que ambas as funções anteriores são lim
#' 
## ------------------------------------------------------------------------
my.vec <- seq(from = 1, to = 25, by=5)
my.rnd.vec <- sample(my.vec)
print(my.rnd.vec)

#' 
#' A função `sample` também permite a seleção alea
#' 
## ------------------------------------------------------------------------
my.rnd.vec <- sample(my.vec, size = 1)
print(my.rnd.vec)

#' 
#' Também é possível selecionar valores de uma amo
#' 
## ------------------------------------------------------------------------
my.vec <- c(10, 15, 20)
my.rnd.vec <- sample(x = my.vec, size = 10, replace = TRUE)
print(my.rnd.vec)

#' 
#' Vale destacar que a função `sample` funciona pa
#' 
#' É importante ressaltar que a geração de valores
#' 
## ------------------------------------------------------------------------
set.seed(seed = 10)
my.rnd.vec.1 <- runif(5)
print(my.rnd.vec.1)

my.rnd.vec.2 <- runif(5)
print(my.rnd.vec.2)

#' 
#' No código anterior, o valor de `set.seed` é um 
#' 
#' 
#' ### Acessando os elementos de um vetor numérico
#' 
#' Todos os elementos de um vetor numérico podem s
#' 
## ------------------------------------------------------------------------
x <- c(-1, 4, -9, 2)
first.elem.x <- x[1]
print(first.elem.x)

#' 
#' A mesma notação é válida para extrair porções d
#' 
## ------------------------------------------------------------------------
sub.x <- x[1:2]
print(sub.x)

#' 
#' Para acessar elementos nomeados de um vetor num
#' 
## ------------------------------------------------------------------------
x <- c(item1 = 10, item2 = 14, item3 = 9, item4 = 2)
print(x['item2'])
print(x[c('item2','item4')])

#' 
#' O acesso aos elementos de um vetor numérico tam
#' 
## ------------------------------------------------------------------------
print(x[x > 0])

#' 
#' Os uso de regras de segmentação dos dados de ac
#' 
#' 
#' ### Modificando e removendo elementos de um vet
#' 
#' A modificação de um vetor é muito simples. Bast
#' 
## ------------------------------------------------------------------------
my.x <- c(1,2,3,4)
my.x[1] <- 5
print(my.x)

#' 
#' Essa modificação também pode ser realizada em b
#' 
## ------------------------------------------------------------------------
my.x <- 0:5
my.x[1:3] <- 5
print(my.x)

#' 
#' A remoção de elementos de um vetor é realizada 
#' 
## ------------------------------------------------------------------------
my.x <- -5:5
my.x <- my.x[-(1:2)]
print(my.x)


#' 
#' 
#' ### Criando grupos a partir de um vetor numéric
#' 
#' Em algumas situações na análise de dados, será 
#' 
#' A função `cut` serve para criar grupos de inter
#' 
## ------------------------------------------------------------------------
my.x <- rnorm(10)
my.cut <- cut(x = my.x, breaks = 5)
print(my.cut)

#' 
#' Observe que os nomes dos elementos da variável 
#' 
#' No uso da função `cut`, também é possível defin
#' 
## ------------------------------------------------------------------------
my.x <- rnorm(10)
my.breaks <- c(min(my.x)-1, -1, 1, max(my.x)+1)
my.labels <- c('Low','Normal', 'High')
my.cut <- cut(x = my.x, breaks = my.breaks, labels = my.labels)

print(my.x)
print(my.cut)

#' 
#' Observe que, neste exemplo, os grupos foram def
#' 
#' 
#' ### Outras funções úteis para a manipulação de 
#' 
#' * **as.numeric** - Converte determinado objeto 
#' 
## ------------------------------------------------------------------------
my.text <- c('1', '2', '3')
class(my.text)
my.x <- as.numeric(my.text)
print(my.x)
class(my.x)

#' 
#' * **sum** - Soma os elementos de um vetor.
#' 
## ------------------------------------------------------------------------
my.x <- 1:50
my.sum <- sum(my.x)
print(my.sum)

#' 	
#' * **max** - Retorna o máximo valor numérico do 
#' 	
## ------------------------------------------------------------------------
x <- c(10, 14, 9, 2)
max.x <- max(x)
print(max.x)

#' 
#' * **min** - Retorna o mínimo valor numérico do 
#' 	
## ------------------------------------------------------------------------
x <- c(12, 15, 9, 2)
min.x <- min(x)
print(min.x)

#' 
#' * **which.max** - Retorna a posição do máximo v
#' 	
## ------------------------------------------------------------------------
x <- c(100, 141, 9, 2)
which.max.x <- which.max(x)
cat(paste('A posição do valor máximo de x é ', which.max.x))
cat(' o seu valor é ', x[which.max.x])

#' 	
#' * **which.min** - Retorna a posição do mínimo v
#' 	
## ---- tidy=FALSE---------------------------------------------------------
x <- c(10, 14, 9, 2)
which.min.x <- which.min(x)
cat(paste('A posição do valor mínimo de x é ', 
          which.min.x, ' e o seu valor é ', x[which.min.x]))

#' 
#' * **sort** - Retorna uma versão ordenada de um 
#' 
## ------------------------------------------------------------------------
x <- runif(5)
print(sort(x, decreasing = FALSE))
print(sort(x, decreasing = TRUE))

#' 
#' * **cumsum** - Soma os elementos de um vetor de
#' 
## ------------------------------------------------------------------------
my.x <- 1:25
my.cumsum <- cumsum(my.x)
print(my.cumsum)

#' 	
#' * **prod** - Realiza o produto de todos os elem
#' 	
## ------------------------------------------------------------------------
my.x <- 1:10
my.prod <- prod(my.x)
print(my.prod)

#' 	
#' * **cumprod** - Calcula o produto cumulativo de
#' 
## ------------------------------------------------------------------------
my.x <- 1:10
my.prod <- cumprod(my.x)
print(my.prod)

#' 	
#' 	
#' ## Classe de caracteres (texto)
#' 
#' A classe de caracteres, ou texto, serve para ar
#' 
#' 
#' ### Criando um objeto simples de caracteres
#' 
#' Todo objeto de caracteres é criado através da e
#' 
## ------------------------------------------------------------------------
my.assets <- c('PETR3', 'VALE4', 'GGBR4')
print(my.assets)

#' 
#' Confirma-se a classe do objeto com a função `cl
#' 
## ------------------------------------------------------------------------
class(my.assets)

#' 
#' 
#' ### Criando objetos estruturados de texto
#' 
#' Em muitos casos no uso do R, estaremos interess
#' 
#' Para criar um vetor textual capaz de unir texto
#' 
## ------------------------------------------------------------------------
my.seq <- 1:20
my.text <- 'text'
my.char <- paste(my.text, my.seq)
print(my.char)

#' 
#' O mesmo procedimento também pode ser realizado 
#' 
## ------------------------------------------------------------------------
my.x <- 'My name is'
my.names <- c('Marcelo', 'Ricardo', 'Tarcizio')
print(paste(my.x, my.names))

#' 
#' Outra possibilidade de construção de textos est
#' 
## ------------------------------------------------------------------------
my.char <- strrep(x = 'abc', times = 5)
print(my.char)

#' 
#' O R também possibilita o acesso direto a todas 
#' 
## ------------------------------------------------------------------------
print(letters)

#' 
## ------------------------------------------------------------------------
print(LETTERS)

#' 
#' Observe que em ambos os casos não é necessário 
#' 
#' Outras variáveis constantes no R são:
#' 
#' * month.abb - Abreviação dos meses do ano.
#' 	
## ------------------------------------------------------------------------
print(month.abb)	

#' 	
#' * month.name - Nome completo dos meses do ano.
#' 	
## ------------------------------------------------------------------------
print(month.name)	

#' 
#' * pi - A constante _pi_
#' 	
## ------------------------------------------------------------------------
print(pi)	

#' 
#' 
#' ### Selecionando pedaços de um texto
#' 
#' Um erro comum praticado pelos iniciantes do R é
#' 
## ------------------------------------------------------------------------
my.char <- 'ABCDE'
print(my.char[2])

#' 
#' O resultado `NA` indica que o segundo elemento 
#' 
## ------------------------------------------------------------------------
print(my.char[1])

#' 
#' O resultado é simplesmente o texto _ABCDE_, que
#' 
## ------------------------------------------------------------------------
my.substr <- substr(x = my.char, start = 3, stop = 4)
print(my.substr)

#' 
#' Essa função também funciona para vetores atômic
#' 
## ------------------------------------------------------------------------
my.assets <- c('PETR3', 'VALE4', 'GGBR4')
my.type.stock <- substr(my.assets, start = 5, stop = 5)
print(my.type.stock)

#' 
#' Para uma melhor organização, podemos utilizar a
#' 
## ------------------------------------------------------------------------
my.type.stock[my.type.stock=='4'] <- 'Pref'
my.type.stock[my.type.stock=='3'] <- 'Ord'

print(my.type.stock)

#' 
#' 
#' ### Localizando e substituindo pedaços de um te
#' 
#' Uma operação útil na manipulação de textos é a 
#' 
#' O exemplo a seguir mostra como encontrar o cara
#' 
## ------------------------------------------------------------------------
my.char <- 'ABCDEF-ABCDEF-ABC'
pos = regexpr(pattern = 'D', text = my.char, fixed = TRUE) 
print(pos)

#' 
#' Observe que a função `regexp` retorna apenas a 
#' 
## ------------------------------------------------------------------------
my.char <- 'ABCDEF-ABCDEF-ABC'
pos = gregexpr(pattern = 'D', text = my.char, fixed = TRUE) 
print(pos)

#' 
#' Observe também que as funções `regexp` e `grepe
#' 
#' Para substituir caracteres em um texto, basta u
#' 
## ------------------------------------------------------------------------
my.char <- 'ABCDEF-ABCDEF-ABC'
my.char <- sub(x = my.char, pattern = 'ABC', replacement = 'XXX')
print(my.char)

#' 
## ------------------------------------------------------------------------
my.char <- 'ABCDEF-ABCDEF-ABC'
my.char <- gsub(x = my.char, pattern = 'ABC', replacement = 'XXX')
print(my.char)

#' 
#' 
#' ### Separando um texto em vários pedaços
#' 
#' Em algumas situações, principalmente no process
#' 
## ------------------------------------------------------------------------
my.char <- 'ABCXABCXBCDX'
split.char <- strsplit(my.char, 'X')
print(split.char)

#' 
## ------------------------------------------------------------------------
my.char <- 'abc ; bcd ; adf'
split.char <- strsplit(my.char, ';')
print(split.char)

#' 
#' A saída dessa função é um objeto do tipo lista,
#' 
## ------------------------------------------------------------------------
 print(split.char[[1]][2])

#' 
#' 
#' ### Descobrindo o número de caracteres de um te
#' 
#' Para descobrir o número de caracteres de um tex
#' 
## ------------------------------------------------------------------------
my.char <- 'abcdef'
my.nchar <- nchar(my.char)
print(my.nchar)

#' 
## ------------------------------------------------------------------------
my.char <- c('a', 'ab', 'abc')
my.nchar <- nchar(my.char)
print(my.nchar)

#' 
#' ### O pacote `stringr`
#' 
#' Para aqueles usuários que irão trabalhar com pr
#' 
#' 
#' ## Fatores
#' 
#' A classe de fatores (`factor`) é utilizada para
#' 
#' A classe de fatores oferece um significado espe
#' 
#' 
#' ### Como criar fatores
#' 
#' A criação de fatores dá-se através da função `f
#' 
## ------------------------------------------------------------------------
my.factor <- factor(c('M','F','M','M','F'))
print(my.factor)

#' 
#' Observe, no exemplo anterior, que a apresentaçã
#' 
## ------------------------------------------------------------------------
my.factor <- factor(c('M','F','M','M','F','ND'))
print(my.factor)

#' 
#' Nesse caso, temos também o grupo `ND` (não defi
#' 
#' Um ponto importante na criação de fatores é que
#' 
## ------------------------------------------------------------------------
my.status <- factor(c('Solteiro', 'Solteiro', 'Solteiro'))
print(my.status)

#' 
#' Nota-se que, por ocasião, os dados mostram apen
#' 
## ---- tidy=FALSE---------------------------------------------------------
my.status <- factor(c('Solteiro', 'Solteiro', 'Solteiro'), 
                    levels = c('Solteiro', 'Casado'))
print(my.status)

#' 
#' 
#' ### Modificando fatores
#' 
#' Um ponto importante sobre os objetos do tipo fa
#' 
## ----warning=TRUE--------------------------------------------------------
my.factor <- factor(c('a', 'b', 'a', 'b'))
my.factor[1] <- 'c'

#' 
#' 
## ------------------------------------------------------------------------
print(my.factor)

#' 
#' Nesse caso, a maneira correta de proceder é pri
#' 
## ------------------------------------------------------------------------
my.factor <- factor(c('a', 'b', 'a', 'b'))
my.char <- as.character(my.factor)
my.char[1] <- 'c'
my.factor <- factor(my.char)
print(my.factor)

#' 
#' Utilizando estas etapas, temos o resultado dese
#' 
#' 
#' ### Convertendo fatores para outras classes
#' 
#' Outro ponto importante no uso de fatores é a su
#' 
## ------------------------------------------------------------------------
my.char <-factor(c('a', 'b', 'c'))
print(as.character(my.char))

#' 
#' Porém, quando fazemos o mesmo procedimento para
#' 
## ------------------------------------------------------------------------
my.values <- factor(5:10)
print(as.numeric(my.values))

#' 
#' Esse resultado pode ser explicado pelo fato de 
#' 
## ------------------------------------------------------------------------
print(as.numeric(as.character(my.values)))

#' 
#' 
#' ### Criando tabelas de contingência
#' 
#' Após a criação de um fator, podemos calcular a 
#' 
## ------------------------------------------------------------------------
my.factor <- factor(sample(c('Pref', 'Ord'), size = 20, replace = TRUE))
print(my.factor)
print(table(my.factor))

#' 
#' Um caso mais avançado do uso de `table` é utili
#' 
## ------------------------------------------------------------------------
my.factor.1 <- factor(sample(c('Pref', 'Ord'), size = 20, replace = TRUE))
my.factor.2 <- factor(sample(paste('Grupo', 1:3), size = 20, replace = TRUE))

print(table(my.factor.1, my.factor.2))

#' 
#' A tabela criada anteriormente mostra o número d
#' 
#' 
#' ### Outras funções para a manipulação de fatore
#' 
#' * **levels** - Retorna os `Levels` de um objeto
#' 
## ------------------------------------------------------------------------
my.factor <- factor(c('A', 'A', 'B', 'C', 'B'))
print(levels(my.factor))

#' 
#' * **as.factor** - Transforma um objeto para a c
#' 	
## ------------------------------------------------------------------------
my.y <- c('a','b', 'c', 'c', 'a')
my.factor <- as.factor(my.y)
print(my.factor)

#' 
#' 
#' * **split** - Com base em um objeto de fator, c
#' 	
## ------------------------------------------------------------------------
my.factor <- factor(c('A','B','C','C','C','B'))
my.x <- 1:length(my.factor)

my.l <- split(x = my.x, f = my.factor)

print(my.l)

#' 	
#' 
#' ## Valores lógicos
#' 
#' Testes lógicos em dados são centrais no uso do 
#' 
#' 
#' ### Criando valores lógicos
#' 
#' Em uma sequência de 1 até 10, podemos verificar
#' 
## ------------------------------------------------------------------------
my.x <- 1:10
print(my.x > 5)
which(my.x > 5)

#' 
#' A função `which` do exemplo anterior retorna os
#' 
#' Para realizar testes de igualdade, basta utiliz
#' 
## ------------------------------------------------------------------------
my.char <- rep(c('abc','bcd'),5)
print(my.char)
print(my.char=='abc')

#' 
#' Para o teste de inigualdades, utilizamos o símb
#' 
## ------------------------------------------------------------------------
print(my.char!='abc')

#' 
#' Destaca-se que também é possível testar condiçõ
#' 
## ------------------------------------------------------------------------
my.x <- 1:10
print((my.x > 4)&(my.x < 7) )

#' 
#' Para mostrar os valores na tela, basta utilizar
#' 
## ------------------------------------------------------------------------
idx <- which( (my.x > 4)&(my.x < 7) )
print(my.x[idx])

#' 
#' Para testar condições não simultâneas, isto é, 
#' 
## ------------------------------------------------------------------------
idx <- which( (my.x > 7)|(my.x < 4) )
print(my.x[idx])

#' 
#' Observe que, em ambos os casos de uso de testes
#' 
#' 	
#' ## Datas e tempo
#' 
#' A representação e manipulação de datas é um imp
#' 
#' 
#' ### Criando datas simples
#' 
#' No R, existem diversas classes que podem repres
#' 
## ------------------------------------------------------------------------
my.date <- as.Date('2016-06-24')
class(my.date)

print(my.date)

#' 
#' Observe, no exemplo anterior, que as datas são 
#' 
## ------------------------------------------------------------------------
my.date <- as.Date('24/06/2016')
print(my.date)

#' 
#' A data de `r my.date` está claramente errada! P
#' 
## ------------------------------------------------------------------------
my.date <- as.Date('24/06/2016', format = '%d/%m/%Y')
print(my.date)

#' 
#' Os símbolos utilizados no _input_ `format`, tal
#' 
#' | Código |          Valor         |Exemplo |
#' |:------:|:----------------------:|:------:|
#' |%d      |dia do mês (decimal)    |0       |
#' |%m      |mês (decimal)           |12      |
#' |%b      |mês (abreviado)         |Abr     |
#' |%B      |mês (nome completo)     |Abril   |
#' |%y      |ano (2 dígitos)         |16      |
#' |%Y      |ano (4 dígitos)         |2016    |
#' 
#' 
#' ### Criando sequências de datas
#' 
#' Um aspecto interessante no uso de objetos do ti
#' 
## ------------------------------------------------------------------------
my.date <- as.Date('24/06/2016', format = '%d/%m/%Y')
my.date.2 <- my.date + 1
print(my.date.2)

#'  
#' A propriedade também funciona com vetores, o qu
#' 
## ------------------------------------------------------------------------
my.date.vec <- my.date + 0:14
print(my.date.vec)

#' 
#' Uma maneira mais customizável de criar sequênci
#' 
## ------------------------------------------------------------------------
my.date.1 <- as.Date('2016-06-27')
my.date.2 <- as.Date('2016-07-27')
my.vec.date <- seq(from = my.date.1, to = my.date.2, by = '2 days')
print(my.vec.date)

#' 
#' Outra forma de utilizar `seq` é definindo o tam
#' 
## ------------------------------------------------------------------------
my.date.1 <- as.Date('2016-06-27')
my.date.2 <- as.Date('2016-07-27')
my.vec.date <- seq(from = my.date.1, to = my.date.2,  length.out = 10)
print(my.vec.date)

#' 
#' 
#' ### Operações com datas
#' 
#' É possível descobrir a diferença de dias entre 
#' 
## ------------------------------------------------------------------------
my.date.1 <- as.Date('2015-06-24')
my.date.2 <- as.Date('2016-06-24')
diff.date <- my.date.2 - my.date.1
print(diff.date)

#' 
#' A saída da operação de subtração é um objeto da
#' 
## ------------------------------------------------------------------------
print(diff.date[[1]])

#' 
#' Podemos testar se uma data é maior do que outra
#' 
## ------------------------------------------------------------------------
my.date.1 <- as.Date('2016-06-20')
my.date.vec <- as.Date('2016-06-20') + seq(-5,5)
my.test <- my.date.vec > my.date.1
print(my.test)

#' 
#' A operação anterior é bastante útil quando se e
#' 
## ------------------------------------------------------------------------
first.date <- as.Date('2016-06-01')
last.date <- as.Date('2016-06-15')

my.date.vec <- as.Date('2016-05-25') + seq(0,30)
my.prices <- seq(1,10, length.out = length(my.date.vec))

print(my.prices)
print(my.date.vec)

my.idx <- (my.date.vec >= first.date) & (my.date.vec <= last.date)

my.prices <- my.prices[my.idx]
print(my.prices)

#' 
#' Neste caso, o vetor final de preços contém apen
#' 
#' 
#' ### Lidando com data e tempo
#' 
#' O uso da classe `Date` é suficiente quando se e
#' 
#' No R, uma das classes utilizadas para esse fim 
#' 
#' Para ambos os objetos de data, o formato tempo/
#' 
## ------------------------------------------------------------------------
my.timedate <- as.POSIXlt('2016-01-01 16:00:00')
print(my.timedate)

#' 
#' Destaca-se que essa classe adiciona automaticam
#' 
## ------------------------------------------------------------------------
my.timedate.tz <- as.POSIXlt('2016-01-01 16:00:00', tz = 'GMT')
print(my.timedate.tz)

#' 
#' É importante ressaltar que, para o caso de obje
#' 
## ------------------------------------------------------------------------
print(my.timedate.tz + 30)

#' 
#' Assim como para a classe `Date`, existem símbol
#' 
#' 
#' | Código |           Valor          | Exemplo |
#' |:------:|:------------------------:|:-------:|
#' | %H     | Hora (decimal, 24 horas) | 23      |
#' | %I     | Hora (decimal, 12 horas) | 11      |
#' | %M     | Minuto (decimal, 0-59)   | 12      |
#' | %p     | Indicador AM/PM          | AM      |
#' | %S     | Segundos (decimal, 0-59) | 50      |
#' 
#' 
#' ### Formatando representações customizadas de d
#' 
#' A notação básica para representar datas e data/
#' 
#' Para formatar uma data, utilizamos a função `fo
#' 
## ------------------------------------------------------------------------
my.dates <- seq(from = as.Date('2016-01-01'), to = as.Date('2016-01-15'), by = '1 day')
my.dates.brformat <- format(my.dates, '%d/%m/%Y')
print(my.dates.brformat)

#' 
#' O mesmo procedimento pode ser realizado para ob
#' 
## ------------------------------------------------------------------------
my.datetime <- as.POSIXlt('2016-01-01 12:00:00') + seq(0,560,60)
my.dates.brformat <- format(my.datetime, '%d/%m/%Y %H:%M:%S')
print(my.dates.brformat)

#' 
#' Pode-se também customizar para formatos bem esp
#' 
## ------------------------------------------------------------------------
my.dates.myformat <- format(my.dates, 'Ano=%Y | Mes=%m | Dia=%d')
print(my.dates.myformat)

#' 
#' ### Conhecendo o horário e data atual
#' 
#' O R inclui várias funções que permitem o usuári
#' 
#' Para conhecer o dia atual, basta utilizarmos a 
#' 
## ------------------------------------------------------------------------
my.day <- Sys.Date()
print(my.day)

#' 
#' Para descobrir a data e horário, utilizamos a f
#' 
## ------------------------------------------------------------------------
print(Sys.time())

#' 
#' Com base nestas, podemos escrever:
#' 
## ------------------------------------------------------------------------
my.str <- paste0('Este código foi executado em ', Sys.time())
print(my.str)

#' 
#' 
#' ### Outras funções úteis para a manipulação de 
#' 
#' * **weekdays** - Retorna o dia da semana de uma
#' 	
## ------------------------------------------------------------------------
my.dates <- seq(from = as.Date('2016-01-01'), to = as.Date('2016-01-5'), by = '1 day')
my.weekdays <- weekdays(my.dates)
print(my.weekdays)

#' 
#' * **months** - Retorna o mês de uma ou várias d
#' 
## ------------------------------------------------------------------------
my.dates <- seq(from = as.Date('2016-01-01'), to = as.Date('2016-12-31'), by = '1 month')
my.months <- months(my.dates)
print(my.months)

#' 
#' * **quarters** - Retorna a localização de uma o
#' 
## ------------------------------------------------------------------------
my.quarters <- quarters(my.dates)
print(my.quarters)

#' 	
#' * **OlsonNames** -  Retorna um vetor com as zon
#' 	
## ------------------------------------------------------------------------
possible.tz <- OlsonNames()
print(possible.tz[1:5])

#' 
#' *	**Sys.timezone** - Retorna a zona de tempo do
#' 	
## ------------------------------------------------------------------------
print(Sys.timezone())

#' 	
#' * **cut** - Retorna um fator a partir da catego
#' 	
## ------------------------------------------------------------------------
my.dates <- seq(from = as.Date('2016-01-01'), to = as.Date('2016-03-01'), by = '5 days')
my.month.cut <- cut(x = my.dates, breaks = 'month', labels = c('Jan', 'Fev', 'Mar'))
print(my.month.cut)

#' 
## ------------------------------------------------------------------------
my.datetime <- as.POSIXlt('2016-01-01 12:00:00') + seq(0,250,15)
my.cut <- cut(x = my.datetime, breaks = '30 secs')
print(my.cut)

#' 		
#' 		
#' ## Dados omissos - `NA` (_Not available_)
#' 
#' Uma das principais inovações do R em relação a 
#' 
#' 
#' ### Definindo valores `NA`
#' 
#' Para definirmos os casos omissos nos dados, bas
#' 
## ------------------------------------------------------------------------
my.x <- c(1,2,NA, 4, 5)
print(my.x)

#' 
#' Vale destacar que a interação de qualquer valor
#' 
## ------------------------------------------------------------------------
print(my.x + 1)

#' 
#' Isso exige cuidado quando se está utilizando al
#' 
## ------------------------------------------------------------------------
my.x <- c(1:5, NA, 5:10)
print(cumsum(my.x))

#' 
#' 
## ------------------------------------------------------------------------
my.x <- c(1:5, NA, 5:10)
print(cumprod(my.x))

#' 
#' Portanto, antes de utilizar as funções `cumsum`
#' 
#' 
#' ### Encontrando e substituindo os valores `NA`
#' 
#' Em muitas situações de importação de dados, alg
#' 
## ------------------------------------------------------------------------
my.x <- c(1:2, NA, 4:10)
idx.na <- is.na(my.x)
print(idx.na)

#' 
#' Para substitui-los, basta indicar o valor de tr
#' 
## ------------------------------------------------------------------------
my.x <- c(1, NA, 3:4)
my.x[idx.na] <- 2
print(my.x)

#' 
#' Outra maneira de limpar o objeto é utilizar a f
#' 
## ------------------------------------------------------------------------
my.char <- c(letters[1:3], NA, letters[5:8])
print(my.char)
my.char <- na.omit(my.char)
print(my.char)

#' 
#' Apesar de o tipo de objeto ter sido trocado, de
#' 
## ------------------------------------------------------------------------
print(nchar(my.char))

#' 
#' Para outros objetos, porém, recomenda-se cautel
#' 
#' 
#' ### Outras funções úteis para tratamento de cas
#' 
#' * **complete.cases** - Retorna um vetor lógico 
#' 	
## ------------------------------------------------------------------------
my.mat <- matrix(1:15, nrow = 5)
my.mat[2,2] <- NA

complete.cases(my.mat)

#' 
#' 