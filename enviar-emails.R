## Envio de emails da revista arena

## Carregando o pacote "blastula" -----------

library(blastula)
library(purrr)
library(glue)

## Definindo as credenciais e a função para enviar emails ---

create_smtp_creds_key(
  id = "gmail",
  user = "ps.revistaarena@gmail.com",
  provider = "gmail",
  use_ssl = TRUE,
  port = 465,
  overwrite = TRUE
)

enviar_email <- partial(smtp_send, 
                        from = "ps.revistaarena@gmail.com",
                        to = "ps.revistaarena@gmail.com",
                        credentials = creds_key("gmail"))

## ----

receivers <- c("isabellar2001@gmail.com",
                  "rafaael.neves@gmail.com")



corpo_emails <- for(i in length(emails)) {
 compose_email(body = md(emails))
}

corpo_emails <- map(emails, compose_email)

envio_email <- partial()
smtp_send(
  email = corpo_emails[i],
  from = "ps.revistaarena@gmail.com",
  to = "ps.revistaarena@gmail.com",
  bcc = teste_emails[i],
  subject = "Processo Seletivo Revista Arena",
  credentials = creds_key("gmail")
)



teste_corpo <- render_email('Email.Rmd')




teste_em <- teste_corpo %>% 
  add_attachment(file = "imagem.jpeg", filename = "calendário.arena.jpeg")


paste0(nomes)



emails_md <- md(emails)



email_isabella <- compose_email(body = md(emails[1]))



enviar_email(email = teste_corpo, bcc = receivers)

smtp_send(
  email = email_isabella,
  from = "ps.revistaarena@gmail.com",
  to = "rafaael.neves@gmail.com",
  bcc = teste_emails,
  subject = "Processo Seletivo Revista Arena",
  credentials = creds_key("gmail")
)



smtp_send(
  email = corpo_emails[i],
  from = "ps.revistaarena@gmail.com",
  to = "ps.revistaarena@gmail.com",
  bcc = teste_emails[i],
  subject = "Processo Seletivo Revista Arena",
  credentials = creds_key("gmail")
)























