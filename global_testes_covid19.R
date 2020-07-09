library(dplyr)
library(tidyr)

base_testes <- read.csv2('../pernambuco/bases/testes.CSV', sep=';') # carga
base_testes_dsp <- read.csv2('../pernambuco/bases/testes_dsp.CSV', sep=';') # carga


## tratamentos de datas
base_testes$dt_boletim <- as.Date(base_testes$dt_boletim, format = "%d/%m/%Y")
base_testes$dt_referencia <- as.Date(base_testes$dt_referencia, format = "%d/%m/%Y")

base_testes_dsp$dt_boletim <- as.Date(base_testes_dsp$dt_boletim, format = "%d/%m/%Y")
base_testes_dsp$dt_referencia <- as.Date(base_testes_dsp$dt_referencia, format = "%d/%m/%Y")
max_dt_dsp <- max(base_testes_dsp$dt_referencia)

grafico_testes <- base_testes %>% group_by(dt_referencia, tipo_lab) %>% summarise(cont = sum(testes))
grafico_testes <-  grafico_testes %>% tidyr::pivot_wider(names_from = c(tipo_lab), values_from = cont)

grafico_testes <- grafico_testes %>% replace(is.na(.), 0)

colnames(grafico_testes) <- c('dt_ref', 'privado', 'publico', 'teste_rapido')
grafico_testes$TOTAL <- grafico_testes$privado + grafico_testes$publico + grafico_testes$teste_rapido

grafico_testes_tipo <- base_testes %>% group_by(dt_referencia, tipo_teste) %>% summarise(cont = sum(testes))

grafico_testes_tipo <-  grafico_testes_tipo %>% tidyr::pivot_wider(names_from = c(tipo_teste), values_from = cont)
grafico_testes_tipo <- grafico_testes_tipo %>% replace(is.na(.), 0)
colnames(grafico_testes_tipo) <- c('dt_ref', 'rt_pcr', 'rapido', 'sorologia')
grafico_testes_tipo$TOTAL <- grafico_testes_tipo$rt_pcr + grafico_testes_tipo$rapido + grafico_testes_tipo$sorologia

