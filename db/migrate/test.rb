require 'unsplash'
Unsplash.configure do |config|
  config.application_id     = "23571"
  config.application_secret = "a5e1e7ac0ceb1aafe45fd6f9bbffd060186aa32a9e365cfe196d67511b7eaeb3"
  config.application_redirect_uri = "https://oo-rails-mister-cocktail.herokuapp.com/d61430de61853e7ddfe273023633075830f8c1e9860868802436d4b033153b03/callback"
  config.utm_source = "oo-mister-cocktail"
end
Unsplash::Client.connection.authorize!("the authentication code")

cocktails_photo = Unsplash::Photo.search('99623fda419853fe79be834cf548e9e3b24a6eee2d9d827ba39514ea439831c6')

puts cocktails_photo
