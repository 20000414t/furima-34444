Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root :to => 'items#index'
resources :items do
  resources :orders
end
end

#ルーティングのネストをする（どの商品に対する購入ページなのかを判別するため）
#ルーティングを確認して詳細画面の購入ボタンのパスを修正する
#Ordersコントローラで＠itemを定義する