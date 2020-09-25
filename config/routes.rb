Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # localhost::3000にアクセスした時にitems#indexが作動するように設定
  root to: "products#index"
  #resources :users
  resources :products do
    resources :product_purchases
  end
  #root to: 'orders#index'
  resources :orders, only:[:create]
end
