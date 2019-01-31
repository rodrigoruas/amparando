PagSeguro.configure do |config|
  config.token       = "033A26CA5C6643519A2687DD3FCB1383"
  config.email       = "robertaazevedo@amparando.com.br"
  config.environment = :sandbox # ou :production. O padrão é production.
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
end
