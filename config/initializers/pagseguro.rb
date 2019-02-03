PagSeguro.configure do |config|
  if Rails.env.production?
    config.token     = "6C1FB8FE551E4504B2C68BA79D8209EC"
    config.environment =  :production
  else
    config.environment =  :sandbox
    config.token     = "033A26CA5C6643519A2687DD3FCB1383"
  end
  config.encoding    = "UTF-8" # ou ISO-8859-1. O padrão é UTF-8.
  config.email       = "robertaazevedo@amparando.com.br"
end

