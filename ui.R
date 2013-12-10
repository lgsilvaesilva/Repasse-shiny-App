# ---------------------------------------------------
# Hackathon - 19/10/2013
# Dados transparência
# Repasse a municípios: ICMS, IPI, IPVA
# Equipe: Solve
# Contribuidor: Rodrigo Citton P. dos Reis
# ui.R
# ---------------------------------------------------
# pacotes

library(shiny)
tabPanelAbout <- source("C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Repasse-shiny-00\\about.r")$value
# ---------------------------------------------------
# Carregando os dados + ...

path <- "C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Dados - desenvolvimento"
file <- "repasse_dados.csv"
repasse <- read.csv(file.path(path,file),header=T) # dados repasse
names(repasse) <- tolower(names(repasse))
names(repasse)[11:13] <- c("icms","ipi","ipva")
repasse$icms <- repasse$icms/1000
repasse$ipi <- repasse$ipi/1000
repasse$ipva <- repasse$ipva/1000
munNomes <- sort(iconv(as.character(unique(repasse$nm_municipio)),to="ASCII//TRANSLIT"))
munList <- as.list(munNomes)
names(munList) <- munNomes
repasse$data_mes <- as.Date(paste(as.character(repasse$aaexercicio),as.character(repasse$cd_mensal),as.character(15),sep="-"),format="%Y-%m-%d")

# dados do atlas Brasil
path <- "C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Dados - desenvolvimento"
file <- "atlas2013_dados_mg.csv"
atlas <- read.csv2(file.path(path,file),header=T,dec=",")
names(atlas) <- tolower(names(atlas))
atlas2010 <- subset(atlas, ano == 2010)
# atlas2010 <- rbind(atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010)

repasse <- merge(repasse,atlas2010,by.x="cd_ibge",by.y="codmun7")

# meso e microrregiões
path <- "C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Dados - desenvolvimento"
file <- "meso.csv"
meso <- read.csv2(file.path(path,file),header=T)
names(meso) <- tolower(names(meso))

repasse <- merge(repasse,meso,by.x="cd_ibge",by.y="geocodig_m")
repasse$nome_meso <- iconv(as.character(repasse$nome_meso),to="ASCII//TRANSLIT")
repasse$nome_micro <- iconv(as.character(repasse$nome_micro),to="ASCII//TRANSLIT")

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Repasse a Municipios"),
  
  sidebarPanel(
    selectInput("mun", "Municipio:",
                munList)
    ),
  
  mainPanel(
    tabsetPanel(
      tabPanel("Indicadores",htmlOutput("gvisMotionChart")),
      tabPanel("Municipios",htmlOutput("gvisTimeLine")),
      tabPanelAbout()
      )
    )
))