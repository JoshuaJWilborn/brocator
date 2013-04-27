Brocator::Application.routes.draw do
  devise_for :users, :controllers => {
  	:omniauth_callbacks => 'omniAuth_callbacks'
  }

  resources :users

	root :to => 'users#index'
end
