Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sessions, only: [:create]
      resources :sign_up, only: [:create]
      resources :recipes do
        resources :claps, only: [:create, :destroy]
      end
      resources :categories
    end
  end
end
