Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :sessions
      resources :sign_up
      resources :recipes do
        resources :claps
      end
      resources :meals
    end
  end
end
