PG_PRODUCTION_TOKEN = "6C1FB8FE551E4504B2C68BA79D8209EC"
PG_SANDBOX_TOKEN = "033A26CA5C6643519A2687DD3FCB1383"
PG_EMAIL = "robertaazevedo@amparando.com.br"


PagSeguro.configure do |config|
  if Rails.env.production?
    config.token     = PG_PRODUCTION_TOKEN
    config.environment =  :production
  else
    config.environment =  :sandbox
    config.token     = PG_SANDBOX_TOKEN
  end
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
  config.email       = PG_EMAIL
end

