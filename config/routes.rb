Rails.application.routes.draw do

  resources :checks
  resources :notes
  namespace :api do
    namespace :v1 do
      resources :managers do
        resources :employees do
          resources :shifts, shallow: true
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
