setwd('~/Documents/dsa/EstudosProprios/RainInBirthDay')
getwd();

# Loading File
fileName = 'chuvas_sp_de_1961_ate_2017.csv'
data = read.csv(fileName, header = TRUE, sep = ',')

summary(data)
str(data)


# Installing lubridate to work with dates
install.packages('lubridate')
library(lubridate)

data$Data = dmy(data$Data)

str(data)
summary(data)

# Getting my birthday
bMonth = 10
bDay = 3
bDate = data[month(data$Data) == bMonth & day(data$Data) == bDay, c('Data', 'Precipitacao')]

# Working with factor in column "Choveu" to improve plots results
bDate$Choveu = as.factor(bDate$Precipitacao > 0)
summary(bDate)

# Plotting
palette(c('blue', 'red'))
plot(bDate$Data, bDate$Precipitacao, main = "No meu aniversário chove?", xlab = 'Ano', ylab = "Intensidade da chuva", col = bDate$Choveu)