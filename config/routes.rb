Rails.application.routes.draw do
  root controller: :landing, action: :index
  resources :dishes, only: [:index, :show]
  get :checkout, controller: :landing, action: :checkout
  resources :charges, only: [:create]
  post :add_to_order, controller: :orders, action: :add_to_order
end
