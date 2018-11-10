Rails.application.routes.draw do
  get 'pages/home'
  get 'pages/login'
  resources :pages
  resources :payments
  resources :search, only: [:index]
  resources :members do
    resources :payments
  end
  get :upcoming_payments, to: "members#upcoming_payments", as: :upcoming_payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'payments#index'
end
