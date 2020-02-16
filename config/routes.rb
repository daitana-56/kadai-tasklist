Rails.application.routes.draw do
  #topページ
  root to: 'tasks#index'
  
  #task用ルーティング
  resources :tasks
  
  #user用ルーティング
  get 'signup', to: 'users#new'
  resources :users, only: [:new, :create]
  
  #session用ルーティング
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
