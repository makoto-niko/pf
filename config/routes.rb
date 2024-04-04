Rails.application.routes.draw do
  devise_for :admin, controllers: {
    sessions: "admin/sessions"
  }
  
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'

  namespace :public, path: '' do
    get 'customers/my_page' => 'customers#show', as: 'my_page'
    get 'customers/information/edit' => 'customers#edit', as: 'edit_information'
    patch 'customers/information' => 'customers#update', as: 'update_information'
    get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
    patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
    
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :posts, only: [:new, :create, :index, :show]
    resources :comments, only: [:index, :create, :destroy]
    resources :groups, only: [:new, :create]
    resources :board_posts, only: [:index, :show, :create, :update, :destroy]
    resources :board_comments, only: [:index, :create, :destroy]
  end

  namespace :admin do
    root to: 'homes#top'
    resources :posts, only: [:destroy]
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :show, :create, :update, :destroy] do
      resources :board_posts, only: [:index, :show, :destroy] do
        resources :board_comments, only: [:index, :destroy]
      end
    end
    resources :customers, only: [:index, :show, :edit, :update]
  end
end