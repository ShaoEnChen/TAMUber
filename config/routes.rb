Rails.application.routes.draw do
	get 'users/index'
	devise_for :users
	root  'homepage#index'
	resources :vehicles, :drivers, :requests, :onduties
	post 'onduties/update_car_pos' => 'onduties#update_car_pos', :as => :update_car_pos
end
