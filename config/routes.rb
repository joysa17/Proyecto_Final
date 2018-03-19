Rails.application.routes.draw do
  resources :comments
  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get 'orders/create'

 resources :products, only: :index do
 	resources :orders, only: :create
 end

 resources :orders, only: :index do
 	collection do
 		get 'clean'
 		get 'payed'
 	end
 end

 resources :billings, only: [:index] do
 	collection do
 		get 'pre_pay'
 		get 'execute'
 end
end 

 root to: 'products#index'
 devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
