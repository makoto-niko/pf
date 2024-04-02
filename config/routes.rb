Rails.application.routes.draw do
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'
 
  devise_for :users
  
  namespace :public, path: '' do
    resources :users, only: [:index, :show, :create, :update, :destroy]
    resources :posts, only: [:index, :show, :create, :update, :destroy]
    resources :comments, only: [:index, :create, :destroy]
    resources :groups, only: [:index, :show, :create, :update, :destroy]
    resources :board_posts, only: [:index, :show, :create, :update, :destroy]
    resources :board_comments, only: [:index, :create, :destroy]
    resources :registrations, only: [:new, :create]
    resources :sessions, only: [:new, :create, :destroy]
    resources :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
  end

  namespace :admin do
    resources :posts, only: [:destroy]
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :show, :create, :update, :destroy]
    resources :board_posts, only: [:index, :show, :destroy]
    resources :board_comments, only: [:index, :destroy]
    resources :sessions, only: [:new, :create, :destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    get 'homes/top'
  end
end
