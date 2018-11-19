Rails.application.routes.draw do
	get 'users/index'
	devise_for :users
	root  'homepage#index'
	resources :vehicles, :drivers, :students
end
