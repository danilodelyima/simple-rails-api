Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :relationships, only: [:create, :destroy]
  resources :brands, except: [:destroy] do
    resources :products, except: [:destroy]
  end
  resources :users, except: [:destroy]
  resources :friendships, only: [:create]
end
