Rails.application.routes.draw do
  resources :users
  # Alternative route for users
  get 'usuarios', to: 'users#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
