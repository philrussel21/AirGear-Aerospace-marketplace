Rails.application.routes.draw do
  root 'pages#index'
  resources :listings
  get 'search', to: 'listings#search'
  resources :profiles, except: [:destroy, :index]
  get 'categories/:name', to: 'categories#show', as: 'category'


  
  devise_for :accounts, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'}, controllers: {registrations: "registrations"}

  # get 'pages/errors'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
