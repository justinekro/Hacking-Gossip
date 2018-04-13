Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'gossips#index'
  resources :gossips do
  	collection do
  		get :autocomplete
  	end
  
  end


  # post '/search', to: "main#search", as: "search"
  # get '/search', to: "gossips#index"

end
