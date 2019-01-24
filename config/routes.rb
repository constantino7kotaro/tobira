Rails.application.routes.draw do
  
  put  "users/:id/update" => 'users#update'
  post "users/create" => "users#create"
  get "users/:id/edit" => "users#edit"
  get "signup" => "users#new"
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
