Rails.application.routes.draw do
	resources :vehicles, :administrators , :drivers
	# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	#root 'vehicles#index'
	#root :to => redirect('/vehicles')
	
	#resources :homepages
	#root :to => redirect('/homepage')
	root  'homepage#index'
end
