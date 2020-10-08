Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  #Shelters
  get '/shelters/:id', to: 'shelters#show'
end
