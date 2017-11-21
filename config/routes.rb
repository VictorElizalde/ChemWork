Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

	resources :groups do
		resources :assignments do
			resources :reports do
				get '/download', to: 'reports#download'
			end
		end
	end

  devise_for :users, :controllers => { registrations: 'registrations' }

	root 'groups#index'

end
