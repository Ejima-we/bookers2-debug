Rails.application.routes.draw do
  get 'search/search'
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  post "create/:id" => "relationships#create", as: "follow"
  post "destroy/:id" => "relationships#destroy", as: "unfollow"
  resources :users,only: [:show,:index,:edit,:update]
  get "users/:id/follow" => "users#follow", as: "users_follow"
  get "users/:id/follower" => "users#follower", as: "users_follower"
  resources :books
  get "/search" => "search#search"
end