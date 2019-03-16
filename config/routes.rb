Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  root to: 'pages#home'
  get "/sobre-nos", to: 'pages#about', as: :about
  get "/pagamento", to: 'payments#pagseguro', as: :pagseguro
  get "/quero-ajudar", to: 'pages#help', as: :help
  get "/doar-agora", to: "unique_donations#new"
  get "/doacao", to: "payments#doacao"

  resources :campaigns, only: [:index, :show] do
    resources :donations, only: [:new, :create, :show] do
      resources :payments, only: [:new, :create]
    end
  end

  namespace :admin do
    resources :campaigns
    resources :users, only: [:show]
  end

  resources :unique_donations, only: [:new, :create, :show] do
    resources :payments, only: [:new, :create]
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
