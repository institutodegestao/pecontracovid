library(dplyr) # comandos pip
library(DT) # tabelas dinâmicas
library(flexdashboard) # dashboard
library(formattable) # formatações
library(gplots) # gráficos
library(lubridate) # datas
library(plotly) # gráficos
library(reshape2) # transformação de dados
# library(tidyr)

# sessionInfo()

### base 1 = covid_prisional_suspeitos
covid_prisional_susp <- read.csv2('../prisional/resultados/covid_prisional_suspeitos.csv', sep = ';', encoding = 'UTF-8') # carga

# deixar os nomes das colunas mais amigáveis para o R
colnames(covid_prisional_susp) <- c('unidade_prisional', 'municipio','geres', 'data_id', 'nome', 'sexo', 'idade', 'faixa_etaria', 'comorbidade', 'realizacao_exame','classificacao','situacao', 'pris_susp') # nomes de colunas

# tratamentos de colunas
covid_prisional_susp$data_id <- as.Date(covid_prisional_susp$data_id, format = "%d/%m/%y")

# calcular data máxima
max_dt_id <- max(covid_prisional_susp$data_id)
min_dt_id <- min(covid_prisional_susp$data_id)

### base 2 = saidas_nominal
saidas <- read.csv2('../prisional/resultados/saidas_nominal.csv', sep = ';', encoding = 'UTF-8') #carga

#deixar os nomes das colunas mais amigáveis para o R
colnames(saidas) <- c('ord', 'unid_prisional', 'nome', 'beneficio', 'data_saida','saida_beneficio') # nomes de colunas

# tratamentos de colunas
saidas$data_saida <- as.Date(saidas$data_saida, format = "%d/%m/%y")


### base 3 = monitoramento_geral
monit_geral <- read.csv2('../prisional/resultados/monitoramento_geral.csv', sep = ';', encoding = 'UTF-8') # carga

#deixar os nomes das colunas mais amigáveis para o R
colnames(monit_geral) <- c('data_tn', 'torn_sistema', 'torn_disponivel', 'torn_em_uso', 'salvo_conduto','prisao_domic','cautelares','exec_penal','agressores','ativas_apartir1703') # nomes de colunas

# tratamentos de colunas
monit_geral$data_tn <- as.Date(monit_geral$data_tn, format = "%d/%m/%y")

# calcular data máxima
max_data_tn <- max(monit_geral$data_tn)
min_data_tn <- min(monit_geral$data_tn)

### base 4 = monitoramento_covid (Saídas por síndrome respiratória aguda grave, podendo ou não ser covid)
monit_srag <- read.csv2('../prisional/resultados/monitoramento_covid.csv', sep = ';', encoding = 'UTF-8') # carga

#deixar os nomes das colunas mais amigáveis para o R
colnames(monit_srag) <- c('data_saida', 'unid_prisional', 'total') # nomes de colunas

# tratamentos de colunas
monit_srag$data_saida <- as.Date(monit_srag$data_saida, format = "%d/%m/%y")

### base 5 = covid_prisional_confirmados (Casos confirmados COVID)
covid_prisional_conf <- read.csv2('../prisional/resultados/covid_prisional_confirmados.csv', sep = ';', encoding = 'UTF-8') # carga

#deixar os nomes das colunas mais amigáveis para o R
colnames(covid_prisional_conf) <- c('unidade_prisional', 'data_id', 'nome', 'sexo', 'idade','faixa_etaria',  'comorbidade', 'data_confirmacao','situacao','local_atual','pris_conf') # nomes de colunas

# tratamentos de colunas
covid_prisional_conf$data_id <- as.Date(covid_prisional_conf$data_id, format = "%d/%m/%y")
covid_prisional_conf$data_confirmacao <- as.Date(covid_prisional_conf$data_confirmacao, format = "%d/%m/%y")

# calcular data máxima
max_dt_cf <- max(covid_prisional_conf$data_confirmacao)
min_dt_cf <- min(covid_prisional_conf$data_confirmacao)

