Rails.application.routes.draw do
  
  get '/stores', to: 'stores#index', as: 'stores' 
  get '/stores/new', to: 'stores#new', as: 'new_store'
  post '/stores', to: 'stores#create'
  get '/stores/:id', to: 'stores#show', as: 'store'
  
  get '/drinks', to: 'drinks#index', as: 'drinks' 
  get '/drinks/new', to: 'drinks#new', as: 'new_drink'
  post '/drinks', to: 'drinks#create'
  get '/drinks/:id', to: 'drinks#show', as: 'drink'

  post '/store_drinks', to: 'store_drinks#create', as: 'create_store_drink'
  get '/store_drinks/:id/delete', to: 'store_drinks#delete', as: 'delete_store_drink'

  get '/', to: 'application#root', as: 'root'
  get '/home', to: 'application#home', as: 'home'

end
