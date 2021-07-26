## Envio de emails da revista arena ----

## Carregando os pacotes ----------

library(blastula)
library(purrr)
library(glue)

## Here we may set the credentials ---------

    user <- "ps.revistaarena@gmail.com"
    email_provider <- "gmail"
    id <- email_provider
    
    create_smtp_creds_key(
      id = id,
      user = user,
      provider = email_provider,
      use_ssl = TRUE,
      port = 465,
      overwrite = TRUE
    )
    

    
## Definindo a função para enviar emails ---
    
    
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
    
##  Definindo fução para compor emails ------
    
    compor_email <- function(body) {
      
      compose_email(body = body,
                    footer = default_footer)
      
    }
    
    
##  Definindo destinatários ----
    
    receivers <- c("rafaael.neves@gmail.com", "isabellar2001@gmail.com")
    
    names_receivers <- c("Rafael", "Isabella")
    
    # Emails e nomes precisam estar em ordem de iteração
    
    