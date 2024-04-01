Rails.application.routes.draw do
  resources :admins
  resources :board_posts
  resources :boards
  resources :group_messages
  resources :group_members
  resources :groups
  resources :post_tags
  resources :tags
  resources :comments
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
