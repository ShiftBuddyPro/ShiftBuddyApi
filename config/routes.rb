Rails.application.routes.draw do
  post 'api/v1/managers/authenticate',
       to: 'api/v1/managers/authentication#authenticate'
  post 'api/v1/managers/employees/authenticate',
       to: 'api/v1/managers/employees/authentication#authenticate'
  namespace :api do
    namespace :v1 do
      resources :employees
      resources :shifts, except: %i[create] do
        member { put :complete }
        scope module: :shifts do
          resources :cash_drops, only: %i[index]
          resources :checks, only: %i[index]
          resources :inventory_items, only: %i[index]
          resources :notes, only: %i[index]
          resources :paid_outs, only: %i[index]
          resource :change_sheet, only: %i[update show]
        end
      end
      resources :cash_drops, except: %i[create]
      resources :checks, except: %i[create]
      resources :inventory_items, except: %i[create]
      resources :notes, except: %i[create]
      resources :paid_outs, except: %i[create]
      resources :managers do
        scope module: :managers do
          resources :activity_logs, only: %i[index]
          resources :shifts, only: %i[index]
          resources :tracked_items, only: %i[index create destroy]
          resources :employees, only: %i[index create] do
            scope module: :employees do
              resources :shifts, only: %i[index create] do
                scope module: :shifts do
                  resources :cash_drops, only: %i[index create]
                  resources :checks, only: %i[index create]
                  resources :inventory_items, only: %i[index create]
                  resources :notes, only: %i[index create]
                  resources :paid_outs, only: %i[index create]
                end
              end
            end
          end
        end
      end
    end
  end
  get '*path',
      to: 'application#fallback_index_html',
      constraints: ->(request) { !request.xhr? && request.format.html? }
end
