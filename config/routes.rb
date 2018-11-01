Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :managers, shallow: true do
        resources :employees do
          resources :shifts do
            resources :checks
            resources :notes
            resources :cash_drops
            resources :paid_outs
            resources :inventory_items
          end
        end
      end
      # Routes to get all of a resource in system
      resources :employees, only: %i[index]
      resources :shifts, only: %i[index]
      resources :cash_drops, only: %i[index]
      resources :checks, only: %i[index]
      resources :notes, only: %i[index]
      resources :cash_drops, only: %i[index]
      resources :paid_outs, only: %i[index]
      resources :inventory_items, only: %i[index]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
