Rails.application.routes.draw do
  devise_for :users do
  get '/users/sign_out' => 'devise/sessions#destroy'
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  get "/sobre-nos", to: 'pages#about', as: :about
end
