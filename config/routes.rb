Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'gossips#index'
  get 'gossips/new', to: 'gossips#new'
  resources :gossips
end
