Rails.application.routes.draw do
  resources :profiles
  root 'pages#index'
  resources :profiles, except: [:destroy, :index]
  devise_for :accounts, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    sign_up: 'register'}, controllers: {registrations: "registrations"}

    # match '/user' => "welcome#index", :as => :user_root
  # get 'pages/errors'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
