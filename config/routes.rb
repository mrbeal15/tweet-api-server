Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/tweets', to: 'tweets#index'
  get '/tweets/topics', to: 'tweets#show'
  post '/tweets', to: 'tweets#create'
end
