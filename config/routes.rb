Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees, only: [:index]
      resources :shifts, only: [:index]
      resources :checks, only: [:index]
      resources :notes, only: [:index]
      resources :cash_drops, only: [:index]
      resources :checks, only: [:index]
      resources :notes, only: [:index]
      resources :cash_drops, only: [:index]
      resources :paid_outs, only: [:index]
      resources :managers do
        resources :employees do
          resources :shifts, shallow: true do
            resources :checks
            resources :notes
            resources :cash_drops
            resources :paid_outs
          end
        end
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
