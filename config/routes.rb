
Rails.application.routes.draw do
  devise_for :users
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :comments
	root to: redirect('/ideas')
  get 'pages/info'
  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  resources :companies do
    resources :staffs
  end
end

