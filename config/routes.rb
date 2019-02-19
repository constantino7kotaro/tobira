Rails.application.routes.draw do
  #NOTE: usersアクションのルーティング
  get "login" => "users#login_form"
  post "login" => "users#login"  
  
  put "users/:id" => 'users#update'
  post "users" => "users#create"
  get "signup" => "users#new"
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  get "users/:id/edit" => "users#edit"
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  #NOTE: lessonsアクションのルーティング
  get "lessons/index" => "lessons#index"
  get "lessons/new" => "lessons#new"
  get 'lessons/:id' => 'lessons#show'
  post "lessons" => "lessons#create"
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
