Rails.application.routes.draw do
 devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
root to: "users#index"
get 'users/sign_up', to: "users#new"
post 'users', to: "users#create"
end
