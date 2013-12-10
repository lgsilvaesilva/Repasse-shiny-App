function(){
  tabPanel("Sobre",
           p(style="text-align:justify",'Este aplicativo web foi desenvolvido para analise dos dados do Portal da Transparencia de Minas Gerais, referente a base de repasse do ICMS, IPI e IPVA do ano de 2012. 
              O aplicativo foi desenvolvido pela Equipe Solve durante o Primeiro Hackathon de Minas, realizado entre os dias 19 e 20 de outubro de 2013 no Plug Minas. Este ainda eh um prototipo, e atualizacoes serao disponibilizadas.'),
           br(),
           
           div(class="row-fluid",strong('Autores'),
               div(class="span4",
                   HTML('<div style="clear: left;"><img src="https://dl.dropboxusercontent.com/u/38449719/Rodrigo.jpg" alt="" style="float: left; margin-right:5px" /></div>'),
                   strong('Rodrigo'),
                   p('Rodrigo',br(),
                     'Estatistic | useR',br()
                   ),
                   br()
               ),
               div(class="span4",
                   HTML('<div style="clear: left;"><img src="https://dl.dropboxusercontent.com/u/38449719/Lu%C3%ADsGustavo.jpg" alt="" style="float: left; margin-right:5px" /></div>'),
                   strong('Luis'),
                   p('Luis',br(),
                     'Estatistic | useR',br()
                   ),
                   br()
               )
               
           ),
#            HTML('<div style="clear: left;"><img src="C:\\Users\\Rodrigo\\Documents\\solve\\HACKATHON\\Apresenta??o\\Rodrigo.jpeg" alt="" style="float: left; margin-right:5px" /></div>'),
#             strong('Autores'),
#             p('Mat',br(),
#               'Estatistic | useR',br()
#             ),
#             br(),
            
            div(class="row-fluid",
                div(class="span4",strong('Related apps'),
                    p(HTML('<ul>'),
                      HTML('<li>'),a("Coastal Alaska Extreme Temperature and Wind Events", href="http://shiny.snap.uaf.edu/temp_wind_events/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a("Arctic Sea Ice Extents and Concentrations", href="http://shiny.snap.uaf.edu/sea_ice_coverage/", target="_blank"),HTML('</li>'),
                      HTML('</ul>')),
                    strong('Code'),
                    p('Source code available at',
                      a('GitHub', href="https://github.com/ua-snap/shiny-apps/tree/master/ak_station_cru_eda", target="_blank")),
                    br()
                ),
                div(class="span4", strong('Related blog posts'),
                    p(HTML('<ul>'),
                      HTML('<li>'),a("R Shiny web app: Alaska climate data EDA", href="http://blog.snap.uaf.edu/2013/05/20/r-shiny-web-app-alaska-climate-data-eda/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a("R Shiny web app: Coastal Alaska extreme temperature and wind events", href="http://blog.snap.uaf.edu/2013/05/20/r-shiny-web-app-extreme-events/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a("R Shiny web app: Arctic sea ice extents and concentrations", href="http://blog.snap.uaf.edu/2013/05/20/r-shiny-web-app-sea-ice/", target="_blank"),HTML('</li>'),
                      HTML('</ul>')),
                    br()
                ),
                div(class="span4",
                    strong('References'),
                    p(HTML('<ul>'),
                      HTML('<li>'),a('Coded in R', href="http://www.r-project.org/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a('Built with the Shiny package', href="http://www.rstudio.com/shiny/", target="_blank"),HTML('</li>'),
                      HTML('<li>'),"Additional supporting R packages",HTML('</li>'),
                      HTML('<ul>'),
                      HTML('<li>'),a('reshape2', href="http://cran.r-project.org/web/packages/reshape2/index.html", target="_blank"),HTML('</li>'),
                      HTML('<li>'),a('ggplot2', href="http://cran.r-project.org/web/packages/ggplot2/index.html", target="_blank"),HTML('</li>'),
                      HTML('<ul>'),
                      HTML('</ul>'))
                )
            )
           )
}