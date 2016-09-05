Rails.application.routes.draw do

  resources :attachments

  resources :products
  devise_for :users
  resources :in_shopping_carts, only:[:create,:destroy]

  post "/email/create", as: :create_email

  get "/carrito", to: "shopping_carts#show"
  post "/add/:product_id", as: :add_to_cart, to: "in_shopping_carts#create"
  post "/pagar", to: "payments#create"

  get "/checkout", to: "payments#checkout"

  authenticated :user do
    root 'welcome#index'
  end

  unauthenticated :user do
    devise_scope :user do
      root 'welcome#unregistered', as: :unregistered_root
    end
  end
end
