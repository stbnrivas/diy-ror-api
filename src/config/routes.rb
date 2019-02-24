# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do

  root to: 'front#index'

  namespace :api do
    namespace :v1 do
      resources :authors do
        resources :books, only: [:index]
      end
      resources :books do
        resources :authors, only: [:index]
        resources :comments, only: [:index, :create]
      end
    end
  end
end
