Rails.application.routes.draw do

  resources :checks
  resources :notes
  resources :shifts
  namespace :api do
    namespace :v1 do
      resources :managers do
        resources :employees
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
