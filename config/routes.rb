Brocator::Application.routes.draw do
  devise_for :users, :controllers => {
  	:omniauth_callbacks => 'omniAuth_callbacks'
  }

  resources :users

	resources :profiles, :only => [:create, :new, :edit, :update, :show]

  get 'events/search' => 'events#search'

  resources :events do
	  member do
		  get 'attend' => 'events#attend'
		end
	end

	get 'geo' => 'geo#search'

  get 'search' => 'profiles#search'

	root :to => 'users#index'
end
