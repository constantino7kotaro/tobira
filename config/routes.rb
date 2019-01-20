Rails.application.routes.draw do
  
  post "users" => "users#create"
  
  get "signup" => "users#new"
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'
  
  get '/' => 'home#top'
  get 'about' => 'home#about'
  
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
