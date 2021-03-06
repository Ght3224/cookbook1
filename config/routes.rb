# frozen_string_literal: true

Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    #   get "/photos" => "photos#index"

    get '/recipes' => 'recipes#index'

    get '/recipes/:id' => 'recipes#show'

    post '/recipes' => 'recipes#create'

    patch '/recipes/:id' => 'recipes#update'

    delete '/recipes/:id' => 'recipes#destroy'

    post '/users' => 'users#create'
  end
end
