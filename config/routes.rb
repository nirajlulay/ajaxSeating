Classroom::Application.routes.draw do
  root :to => "sessions#new"
  resources :charts 
  resources :users
  resource :session
  match '/login' => "sessions#new", :as => "login"
  match '/logout' => "sessions#destroy", :as => "logout"
end