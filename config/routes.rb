Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Root
  get '/', to: 'welcome#index'

  # Shelters
  get '/shelters', to: 'shelters#index'
  get '/shelters/new', to: 'shelters#new'
  post '/shelters', to: 'shelters#create'
  get '/shelters/:id', to: 'shelters#show'
  get '/shelters/:id/edit', to: 'shelters#edit'
  patch '/shelters/:id', to: 'shelters#update'
  delete '/shelters/:id', to: 'shelters#destroy'

  # Pets
  get '/pets', to: 'pets#index'
  get '/pets/:id', to: 'pets#show'

  # Shelter Pets
  get '/shelters/:id/pets', to: 'shelterpets#index'
end
