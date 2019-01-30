Rails.application.routes.draw do
  root to: 'pages#home'
  get "/sobre-nos", to: 'pages#about', as: :about

  resources :campaigns, only: [:index, :show] do
    resources :donations, only: [:new, :create, :show] do
      resources :payments, only: [:new, :create]
    end
  end

  namespace :admin do
    resources :campaigns
    # resources :donations
  end

  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
