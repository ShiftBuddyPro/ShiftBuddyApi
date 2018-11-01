Rails.application.routes.draw do
  resources :inventory_items
  namespace :api do
    namespace :v1 do
      resources :managers do
        resources :employees do
          resources :shifts, only: %i[index create] do
            resources :checks, only: %i[index create]
            resources :notes, only: %i[index create]
            resources :cash_drops, only: %i[index create]
            resources :paid_outs, only: %i[index create]
            resources :notes, only: %i[index create]
            resources :inventory_items, only: %i[index create]
          end
        end
      end
      resources :employees
      resources :shifts
      resources :checks
      resources :cash_drops
      resources :checks
      resources :notes
      resources :cash_drops
      resources :paid_outs
      resources :inventory_items
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
