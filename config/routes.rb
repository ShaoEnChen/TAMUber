Rails.application.routes.draw do
  resources :routers
	get 'users/index'
	devise_for :users
	root  'homepage#index'
	resources :vehicles, :drivers
end
