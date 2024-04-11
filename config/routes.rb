Rails.application.routes.draw do
  devise_for :admin, controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }
  devise_for :users, controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  devise_scope :user do
    post "users/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  root to: 'public/homes#top'
  get '/about', to: 'public/homes#about', as: 'about'
  get 'public/searches', to: 'public/searchs#search'
  namespace :public, path: '' do
    resources :users do
      collection  do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :groups, only: [:index, :show] do
      resources :boards do
        resources :comments, only: [:index, :create, :destroy] do
        end
      end
    end
    resources :tags, only: [:index, :show, :destroy]
  end
  namespace :admin do
    root to: 'admin/homes#top'
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :boards, only: [:index, :show, :destroy] do
        #resources :comments, only: [:index, :destroy]
      end
    end
    resources :users, only: [:index, :show, :edit, :update]
  end
end