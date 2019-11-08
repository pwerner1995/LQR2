Rails.application.routes.draw do
  
  get '/stores', to: 'stores#index', as: 'stores' 
end
