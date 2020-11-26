Rails.application.routes.draw do
  resources :transactions
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "user#show"
end
