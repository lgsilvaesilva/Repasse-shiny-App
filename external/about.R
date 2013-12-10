function(){
  tabPanel("Sobre",
           p(style="text-align:justify",'Este aplicativo web foi desenvolvido para analise dos dados do Portal da Transparencia de Minas Gerais, referente a base de repasse do ICMS, IPI e IPVA do ano de 2012. 
              O aplicativo foi desenvolvido pela Equipe Solve durante o Primeiro Hackathon de Minas, realizado entre os dias 19 e 20 de outubro de 2013 no Plug Minas pelo Movimento Minas - Escritorio de Prioridades Estrategicas. Este ainda eh um prototipo, e atualizacoes serao disponibilizadas.'),
           br(),
           div(class="row-fluid",
               div(class="span4",
                   HTML('<div style="clear: both;"><img src="https://dl.dropboxusercontent.com/u/18900988/logo_solve_pb.jpg" alt="" width="100" height="100" style="float: left; margin-right:5px" /></div>'),
                   br()
                   ),
               div(class="span4",
                   HTML('<div style="clear: both;"><img src="https://dl.dropboxusercontent.com/u/18900988/R-logo.png" alt="" width="100" height="100" style="float: left; margin-right:5px" /></div>'),
                   br()
               ),
               div(class="span4",
                   HTML('<div style="clear: both;"><img src="https://dl.dropboxusercontent.com/u/18900988/banner-blog1.jpg" alt="" width="100" height="100" style="float: left; margin-right:5px" /></div>'),
                   br()
               )
           ),
           br(),
           strong('Mapas - Ano 2012'),
           br(),
           p(HTML('<ul>'),
             HTML('<li>'),a('ICMS', href="https://maps.google.com.br/maps?q=https://dl.dropboxusercontent.com/u/18900988/minas_icms.kmz&hl=pt-BR&ll=-18.979026,-45.593262&spn=12.632058,21.643066&sll=-14.408749,-51.663108&sspn=50.259821,86.572266&t=m&z=6", target="_blank"),HTML('</li>'),
             HTML('<li>'),a('IPI', href="https://maps.google.com.br/maps?q=https://dl.dropboxusercontent.com/u/18900988/minas_ipi.kmz&hl=pt-BR&sll=-14.408749,-51.663108&sspn=46.512039,57.392578&t=m&z=6", target="_blank"),HTML('</li>'),
             HTML('<li>'),a('IPVA', href="https://maps.google.com.br/maps?q=https://dl.dropboxusercontent.com/u/18900988/minas_ipva.kmz&hl=pt-BR&sll=-14.408749,-51.663108&sspn=46.512039,57.392578&t=m&z=6", target="_blank"),HTML('</li>'),
             HTML('</ul>')),
           br(),
           strong('Autores'),
           div(class="row-fluid",
               div(class="span6",
                HTML('<div style="clear: left;"><img src="https://dl.dropboxusercontent.com/u/18900988/Rodrigo.jpg" alt="" width="100" height="100" style="float: left; margin-right:5px" /></div>'),
                strong('Rodrigo Citton P. dos Reis'),
                p('Estatistico | useR'
                ),br(),
                a('Twitter', href="https://twitter.com/RodrigoSolve", target="_blank"),
                br()
                ),
               div(class="span6",
                HTML('<div style="clear: left;"><img src="https://dl.dropboxusercontent.com/u/18900988/Lu%C3%ADsGustavo.jpg" alt=""  width="100" height="100" style="float: left; margin-right:5px" /></div>'),
                strong('Luis Gustavo S. e Silva'),
                p('Estatistico | useR'
                ),br(),
                a('Twitter', href="https://github.com/lgsilvaesilva/Repasse-shiny-App", target="_blank"),
                br()
               )
           ),
           strong('Referencias'),
           br(),
           p(HTML('<ul>'),
             HTML('<li>'),a('Escrito em R', href="http://www.r-project.org/", target="_blank"),HTML('</li>'),
             HTML('<li>'),a('Construido com o pacote Shiny', href="http://www.rstudio.com/shiny/", target="_blank"),HTML('</li>'),
             HTML('<li>'),"Pacotes do R tambem utilizados",HTML('</li>'),
             HTML('<ul>'),
             HTML('<li>'),a('spGoogle', href="https://github.com/lgsilvaesilva/spGoogle", target="_blank"),HTML('</li>'),
             HTML('<li>'),a('googleVis', href="http://cran.r-project.org/web/packages/googleVis/index.html", target="_blank"),HTML('</li>'),
             HTML('<li>'),a('reshape2', href="http://cran.r-project.org/web/packages/reshape2/index.html", target="_blank"),HTML('</li>'),
             HTML('</ul>'),
             HTML('</ul>')),
           br(),
           strong('Codigo'),
           p('Codigo fonte disponivel em',
             a('GitHub', href="https://github.com/lgsilvaesilva/Repasse-shiny-App", target="_blank")),
           br()
          )
}