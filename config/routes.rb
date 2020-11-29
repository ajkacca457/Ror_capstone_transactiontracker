Rails.application.routes.draw do
  resources :transactions, except: [:show]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :groups, except: [:destroy,:edit]
  resources :user, only: [:show]
  root "user#show"
  get '/etransactions', to: 'transactions#etransaction'
end
