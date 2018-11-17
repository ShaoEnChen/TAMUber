Rails.application.routes.draw do
  resources :routers
	get 'users/index'
	devise_for :users
	root  'homepage#index'
	resources :vehicles, :drivers
	post 'routers/add_db' => 'routers#add_db', :as => :add_db
end
