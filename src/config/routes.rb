# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :authors
      resources :books do
        resources :comments, only: [:index, :create]
      end
    end
  end
end
