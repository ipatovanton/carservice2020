Rails.application.routes.draw do
  devise_for :users

  mount Attachinary::Engine => "/attachinary"

  resources :settings
  resources :services do
  	resources :items
  end

  resources :pages do
		collection do
	    patch :sort
	  end
	end
	get 'admin', to: 'pages#admin'
	root to: 'pages#home'
end
