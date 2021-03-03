Rails.application.routes.draw do
  get 'search/search'
  root 'homes#top'
  get 'home/about' => 'homes#about'
  devise_for :users
  post "follow/:id" => "relationships#follow", as: "follow"
  post "unfollow/:id" => "relationships#unfollow", as: "unfollow"
  resources :users,only: [:show,:index,:edit,:update] 
  get "users/:id/follow" => "users#follow", as: "users_follow"
  get "users/:id/follower" => "users#follower", as: "users_follower"
  resources :books
  get "/search" => "search#search"
end