Rails.application.routes.draw do
  devise_for :users
  root 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show] do
  	resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  	# resourcesなのでそのコントローラのidがリクエストに含まれる。
  		resource :favorites, only: [:create, :destroy]
  		resource :post_comments, only: [:create]
  	end
  		resources :users, only: [:show]
  	# resourceにするとそのコントローラのidがリクエストに含まれなくなる。（＝詳細showページの表示が不要ならrecource）
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
