Rails.application.routes.draw do
  resources :cows
  root '#index'
  get '/index'
  get '/new'

  resources :cows do
    member do
      get :upvote
    end
  end
end
