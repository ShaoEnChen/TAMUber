Rails.application.routes.draw do
	get 'users/index'
	devise_for :users
	root  'onduties#index'
	resources :vehicles, :drivers, :requests, :onduties
end
