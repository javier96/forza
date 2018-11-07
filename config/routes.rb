Rails.application.routes.draw do
  resources :payments
  resources :members
  get :upcoming_payments, to: "members#upcoming_payments", as: :upcoming_payments
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'payments#index'
end
