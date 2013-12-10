# ---------------------------------------------------
# Hackathon - 19/10/2013
# Dados transpar?ncia
# Repasse a munic?pios: ICMS, IPI, IPVA
# Equipe: Solve
# Contribuidor: Rodrigo Citton P. dos Reis
# server.R
# ---------------------------------------------------
# pacotes

library(ggplot2)
library(googleVis)
library(shiny)
library(plyr)

# ---------------------------------------------------
# Carregando os dados + ...

load("data/dados.RData")

# path <- "C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Dados - desenvolvimento"
# file <- "repasse_dados.csv"
# repasse <- read.csv(file.path(path,file),header=T) # dados repasse
names(repasse) <- tolower(names(repasse))
names(repasse)[11:13] <- c("icms","ipi","ipva")
repasse$icms <- repasse$icms/1000
repasse$ipi <- repasse$ipi/1000
repasse$ipva <- repasse$ipva/1000
repasse$nm_municipio <- iconv(as.character(repasse$nm_municipio),to="ASCII//TRANSLIT")
munNomes <- sort(iconv(as.character(unique(repasse$nm_municipio)),to="ASCII//TRANSLIT"))
munList <- as.list(munNomes)
names(munList) <- munNomes
repasse$data_mes <- as.Date(paste(as.character(repasse$aaexercicio),as.character(repasse$cd_mensal),as.character(15),sep="-"),format="%Y-%m-%d")

# dados do atlas Brasil
# path <- "C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Dados - desenvolvimento"
# file <- "atlas2013_dados_mg.csv"
# atlas <- read.csv2(file.path(path,file),header=T,dec=",")

names(atlas) <- tolower(names(atlas))
atlas2010 <- subset(atlas, ano == 2010)
# atlas2010 <- rbind(atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010,atlas2010)

repasse <- merge(repasse,atlas2010,by.x="cd_ibge",by.y="codmun7")

# meso e microrregi?es
# path <- "C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Dados - desenvolvimento"
# file <- "meso.csv"
# meso <- read.csv2(file.path(path,file),header=T)
names(meso) <- tolower(names(meso))

repasse <- merge(repasse,meso,by.x="cd_ibge",by.y="geocodig_m")
repasse$nome_meso <- iconv(as.character(repasse$nome_meso),to="ASCII//TRANSLIT")
repasse$nome_micro <- iconv(as.character(repasse$nome_micro),to="ASCII//TRANSLIT")

# ---------------------------------------------------
# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  output$gvisMotionChart <- renderGvis({
    repasse_motion <- repasse[c("nm_municipio","nome_meso","nome_micro","icms","ipi","ipva","data_mes","espvida","fectot","mort1","e_anosestudo","ppob","rdpc","idhm","pesotot")]
    names(repasse_motion) <- c("Municipio","Mesorregiao","Microrregiao","ICMS","IPI","IPVA","Data","Esperanca de vida ano nascer","Taxa de fecundidade total","Mortalidade infantil","Expectativa de anos de estudo","Percent. vulneraveis a pobreza","Renda per capita media","IDHM","Populacao")
    gvisMotionChart(data=repasse_motion,idvar="Municipio",timevar="Data",xvar="ICMS",yvar="IDHM",sizevar="Populacao",colorvar="Mesorregiao")
    })
  
    output$gvisTimeLine <- renderGvis({
    repasseMun <- subset(repasse,nm_municipio==input$mun)
    repasseMun <- arrange(repasseMun,cd_mensal)
    repasseMun <- repasseMun[,-1]
    #      repasseMun$data <- as.Date(paste(as.character(repasseMun$aaexercicio),as.character(repasseMun$cd_mensal),as.character(15),sep="-"),format="%Y-%m-%d")
    repasseMun_icms <- repasseMun[,1:10]
    names(repasseMun_icms)[10] <- "valor"
    repasseMun_icms$tributo <- "icms"
    repasseMun_ipi <- repasseMun[,c(1:9,11)]
    names(repasseMun_ipi)[10] <- "valor"
    repasseMun_ipi$tributo <- "ipi"
    repasseMun_ipva <- repasseMun[,c(1:9,12)]
    names(repasseMun_ipva)[10] <- "valor"
    repasseMun_ipva$tributo <- "ipva"
    
    repasseMun_emp <- rbind(repasseMun_icms,repasseMun_ipi,repasseMun_ipva)
    repasseMun_emp$data <- as.Date(paste(as.character(repasseMun_emp$aaexercicio),as.character(repasseMun_emp$cd_mensal),as.character(15),sep="-"),format="%Y-%m-%d")
    
        gvisAnnotatedTimeLine(repasseMun_emp,
                              datevar="data",
                              numvar="valor",
                              idvar="tributo",
                              options=list(displayAnnotations=TRUE,
                                           width=600, height=400)
        )    
  })
  #   output$plot <- renderPlot({
  #      repasseMun <- subset(repasse,nm_municipio==input$mun)
  #      repasseMun <- arrange(repasseMun,cd_mensal)
  #      repasseMun <- repasseMun[,-1]
  # #      repasseMun$data <- as.Date(paste(as.character(repasseMun$aaexercicio),as.character(repasseMun$cd_mensal),as.character(15),sep="-"),format="%Y-%m-%d")
  #      repasseMun_icms <- repasseMun[,1:10]
  #      names(repasseMun_icms)[10] <- "valor"
  #      repasseMun_icms$tributo <- "icms"
  #      repasseMun_ipi <- repasseMun[,c(1:9,11)]
  #      names(repasseMun_ipi)[10] <- "valor"
  #      repasseMun_ipi$tributo <- "ipi"
  #      repasseMun_ipva <- repasseMun[,c(1:9,12)]
  #      names(repasseMun_ipva)[10] <- "valor"
  #      repasseMun_ipva$tributo <- "ipva"
  #      
  #      repasseMun_emp <- rbind(repasseMun_icms,repasseMun_ipi,repasseMun_ipva)
  #      repasseMun_emp$data <- as.Date(paste(as.character(repasseMun_emp$aaexercicio),as.character(repasseMun_emp$cd_mensal),as.character(15),sep="-"),format="%Y-%m-%d")
  #      
  # #     gvisAnnotatedTimeLine(repasseMun_emp,
  # #                           datevar="data",
  # #                           numvar="valor",
  # #                           idvar="tributo",
  # #                           options=list(displayAnnotations=TRUE,
  # #                                        width=600, height=400)
  # #     )
  # #     
  #       p <- ggplot(repasseMun_emp,aes(x=data,y=valor,colour=tributo))+geom_line() +
  #            labs(x = "M?s", y = "Valor", colour = "Tributo")
  #      print(p)
  #      
  #      })        
  #     p <- ggplot(repasseMun_emp,aes(x=data,y=valor,colour=tributo))+geom_line() +
  #       labs(x = "M?s", y = "Valor", colour = "Tributo")
  #     print(p)
})