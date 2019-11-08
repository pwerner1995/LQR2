Rails.application.routes.draw do
  
  get '/stores', to: 'stores#index', as: 'stores' 
  get '/stores/:id', to: 'stores#show', as: 'store'
  
end
