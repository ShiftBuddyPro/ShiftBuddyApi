Rails.application.routes.draw do

  resources :notes
  namespace :api do
    namespace :v1 do
      resources :managers do
        resources :employees do
          resources :shifts, shallow: true do
            resources :checks
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
