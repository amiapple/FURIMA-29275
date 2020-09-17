Rails.application.routes.draw do
  devise_for :users
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # localhost::3000にアクセスした時にitems#indexが作動するように設定
  root to: "products#index"
  resources :users, only: [:edit, :update]
  resources :products
  # itemsコントローラーを作成し、indexアクションを定義
  
  # localhost::3000にアクセスした時にしっかりとトップページが開くか確認
  # 変更内容をコミット&プッシュ
  # git push heroku masterコマンドをターミナルで実行
end
