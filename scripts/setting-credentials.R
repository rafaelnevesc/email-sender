## Here we may set the credentials 

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
