Todo::Application.routes.draw do
  resources :users do 
    resources :lists, except: [:index]
  end

  resources :lists, only: [] do
    resources :items, only: [:create, :new]
  end

  namespace :api do
    resources :users, :lists
  end

  resources :items, only: [:destroy]

  root to: 'users#new'
end
