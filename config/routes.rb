Rails.application.routes.draw do
  #topページ
  root to: 'tasks#index'
  
  #task用ルーティング
  resources :tasks
  
  #user用ルーティング
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
end
