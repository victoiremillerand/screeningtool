Rails.application.routes.draw do

  root to: 'pages#home'
  resources :startups, only: [:index, :show, :new, :create, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
