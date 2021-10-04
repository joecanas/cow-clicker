Rails.application.routes.draw do
  resources :cows
  root 'cows#index'
  get 'cows/index'
  get 'cows/new'

  resources :cows do
    member do
      get :upvote
    end
  end
end
