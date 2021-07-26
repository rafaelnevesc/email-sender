## Envio de emails da revista arena

## Carregando os pacotes ----------

  library(blastula)
  library(purrr)
  library(glue)

##  a função para enviar emails ---

    
    enviar_email <- function(email, bcc) {
      
            smtp_send(
                          email = email,
                          bcc = bcc,
                          from = "ps.revistaarena@gmail.com",
                          to = "ps.revistaarena@gmail.com",
                          credentials = creds_key("gmail"),
                          
                          # Necessário inserir o assunto
                          
                          subject = " "
                      )
      }

    
##  Definindo destinatários ----

    receivers <- c("isabellar2001@gmail.com"," rafaael.neves@gmail.com")

    names_receivers <- c("Isabella", "Rafael")
    
    # Emails e nomes precisam estar em ordem

## Fazendo o corpo do email

    raw_body <- glue(
        
      # É necessário definir as variáveis a priori
      
      "**Parabéns, {names_receivers}!**  
      
    
        \n**Você passou na primeira etapa do processo seletivo da Revista Arena.**    
          
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Primeiramente, a equipe da Revista 
        Arena gostaria de agradecer pela sua inscrição no processo seletivo. 
        Tivemos mais de 300 inscritos, superando todas as nossas expectativas! 
        Tivemos que redesenhar as etapas do processo, que agora será mais longo, 
        constituído de **4 etapas**, para conseguirmos dar conta de tantas pessoas 
        interessadas! Vocês já fizeram a **fase 1**, que foi a inscrição 
        propriamente dita. Agora, começamos a **fase 2** do nosso processo seletivo.  
        
        
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Enviamos logo abaixo o link para o 
        formulário com o nosso Fit Cultural. O objetivo desta etapa é entender 
        o  seu perfil. Queremos saber um pouco sobre suas características, sua 
        disponibilidade, suas experiências passadas, suas habilidades, qualidades 
        e defeitos. Queremos saber, principalmente, como você consegue agregar 
        para o time da Revista. **Esta será uma etapa eliminatória.**    
          
          
        \n[Fit Cultural](https://forms.gle/gGHzCWVFB28JcvJa8)    
        
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;O formulário é relativamente longo, 
        então reserve de 20 a 30 minutos do seu dia para preenchê-lo. Essa é uma 
        etapa muito importante, pois conseguiremos conhecer um pouco mais de cada 
        um de vocês. O prazo de entrega é até o dia 06/07, terça-feira, às 12h 
        (meio-dia). Em anexo a este email está o calendário com as datas de início 
        e fim de todas as etapas.    
        
        \n**Um pouco mais sobre a revista.**  
          
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Revista Arena foi uma iniciativa 
        do CASA, Centro Acadêmico Stuart Angel, que é o centro acadêmico do 
        Instituto de Economia da UFRJ. A equipe começou em setembro de 2020, 
        com os quatro fundadores iniciais, Maria, Dora, Samuel e Isabelle, todos 
        alunos de economia, que trabalhavam principalmente coletando textos 
        externos, com alguns autorais ocasionalmente. A ideia era criar um espaço 
        para os alunos terem voz e desenvolverem suas habilidades de escrita e 
        comunicação, escrevendo sobre temas relacionados a economia, sociedade 
        e política. O nome é em homenagem ao Teatro Arena, localizado no Palácio 
        Universitário, no Campus da Praia Vermelha da UFRJ, lugar muito simbólico, 
        pois foi palco de diversos episódios em que os estudantes tiveram voz, 
        principalmente durante a ditadura militar (podemos contar um pouco melhor 
        essa história depois).  
        
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;A Revista abriu seu primeiro processo 
        seletivo em 20.2 e, com a chegada de novos integrantes, pudemos expandir 
        ainda mais as operações. Esse processo que você está participando, contudo, 
        é um processo que chegou aos mais diversos cursos por toda UFRJ e às mais 
        diversas pessoas. Para se ter uma ideia, o curso de economia representa 
        apenas 6% das inscrições.  
        
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Vale lembrar que a revista ainda 
        **não** conta como horas complementares. Este é um projeto que estamos
        atualmente trabalhando, mas ainda não foi implementado.  
        
        \n&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Esperamos que você dê seu melhor 
        nessa segunda fase!  
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Siga nossas redes sociais e conheça 
        alguns dos textos já publicados!  
          
        \n[Medium](https://revistaarena.medium.com/)
        \n[Instagram](https://instagram.com/arena.ufrj)
        \n[Twitter](https://twitter.com/arenaufrj)
        \n[Facebook](https://www.facebook.com/arena.ufrj/ )
        
        \nAtenciosamente,   
        \n*Equipe da Revista Arena*"    
          
    )
  
    list_body <- as.list(raw_body)
    
      # Criar como lista contendo a mensagem para cada destinatário
    
    mded_raw_body <- lapply(list_body, md)
    
      # Aplicar a função blastula::md() em cada uma das mensagens, para texto
      # ser interpretado como mardown
    
## Criando o loop para criar as várias mensagens
    
    emails_bodies <- lapply(mded_raw_body, compose_email)
    
      # Transformando os arquivos markdown em formato blastula_message 
      # e email_message
    
## Enviando com a função purrr::map2
    
   
    map2(emails_bodies, receivers, enviar_email)
    
      # Necessário colocar em ordem de argumentos que foram apresentados quando
      # a função enviar_email() foi definida. Colocar lista de emails e vetor de
      # destinatários que irão se iterar paralelamente e fazer o envio.
  
