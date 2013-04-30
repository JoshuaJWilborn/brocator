Brocator::Application.routes.draw do
  devise_for :users, :controllers => {
  	:omniauth_callbacks => 'omniAuth_callbacks'
  }

  resources :users

	resources :profiles, :only => [:create, :new, :edit, :update, :show]

	get 'geo' => 'geo#search'

  get 'search' => 'profiles#search'

	root :to => 'users#index'
end
