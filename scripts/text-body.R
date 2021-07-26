## Header ----

## Footer ----

    sending_date <-
      paste0(
        format(Sys.time(), "%A, "),
        format(Sys.time(), "%d") %>% as.numeric(),
        " de ",
        format(Sys.time(), "%B"),
        " de ",
        format(Sys.time(), "%Y")
      )
    
    default_footer <- md(glue(
      "*Equipe da Revista Arena*  
      \nNossos contatos:
      [Medium](https://revistaarena.medium.com/) |
      [Instagram](https://instagram.com/arena.ufrj) **|**
      [Twitter](https://twitter.com/arenaufrj) **|**
      [Facebook](https://www.facebook.com/arena.ufrj/)  
      \nEnviado em {sending_date}."
    ))


## Fazendo o corpo do email ----

    raw_body <- glue(
      
      # É necessário definir as variáveis a priori
      
      "Olá, {names_receivers}!  
          
        
            \n**Você está participando do primeiro envio de emails da Revista Arena!**  
            \nAo que parece, tudo está nos conformes.
            "
    )
    
    list_body <- as.list(raw_body)

      # Criar como lista contendo a mensagem para cada destinatário

    mded_raw_body <- lapply(list_body, md)

      # Aplicar a função blastula::md() em cada uma das mensagens, para texto
      # ser interpretado como mardown

## Criando o loop para criar as várias mensagens

    (emails_bodies <- lapply(mded_raw_body, compor_email))

      # Transformando os arquivos markdown em formato blastula_message 
      # e email_message





