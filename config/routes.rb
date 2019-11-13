Rails.application.routes.draw do
  
  get '/stores', to: 'stores#index', as: 'stores' 
  get '/stores/new', to: 'stores#new', as: 'new_store'
  post '/stores', to: 'stores#create'
  get '/stores/stores_search', to: 'stores#store_search', as: 'store_search'
  get '/stores/inventory', to: 'stores#inventory', as: 'inventory'
  get '/stores/inventory_search', to: 'stores#inventory_search', as: 'inventory_search'
  get '/stores/:id', to: 'stores#show', as: 'store'
  

  get '/drinks', to: 'drinks#index', as: 'drinks' 
  get '/drinks/new', to: 'drinks#new', as: 'new_drink'
  post '/drinks', to: 'drinks#create'
  get '/drinks/drinks_search', to: 'drinks#drink_search', as: 'drink_search'
  get '/drinks/beers', to: 'drinks#beers', as: 'beers'
  get '/drinks/beer_search', to: 'drinks#beer_search', as: 'beer_search'
  get '/drinks/wines', to: 'drinks#wines', as: 'wines'
  get '/drinks/wines_search', to: 'drinks#wine_search', as: 'wine_search'
  get '/drinks/liquors', to: 'drinks#liquors', as: 'liquors'
  get '/drinks/liquors_search', to: 'drinks#liquor_search', as: 'liquor_search'
  get '/drinks/:id', to: 'drinks#show', as: 'drink'
  

  post '/store_drinks', to: 'store_drinks#create', as: 'create_store_drink'
  get '/store_drinks/:id/delete', to: 'store_drinks#delete', as: 'delete_store_drink'

  get '/', to: 'application#root', as: 'root'
  get '/home', to: 'application#home', as: 'home'

  resources :users, only: [:new, :show, :create]
  get '/login', to: 'sessions#new', as: 'login'
  post '/sessions', to: 'sessions#create', as: 'sessions'
  delete '/sessions', to: 'sessions#delete'

  get '/users/create_store/:id', to: 'users#create_store', as: 'create_store'
  post '/users/add_store', to: 'users#add_store', as: 'add_store'
  
end
