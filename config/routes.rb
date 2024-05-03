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
  
  namespace :public, path: '', as: 'public' do
    resources :users, path_names: { edit: 'mypage' } do
      collection do
        get :unsubscribe
        patch :withdraw
      end
      resource :chats, only: [:create, :show]
      resource :relationships, only: [:create, :destroy] do
        post 'follow', to: 'relationships#create', on: :member, as: 'follow'
        delete 'unfollow', to: 'relationships#destroy', on: :member, as: 'unfollow'
      end
      get :followings, on: :member
      get :followers, on: :member
    end
   
    resources :contacts, only: [:new, :create] do
      collection do
          get 'confirm', to: 'contacts#reload', as: 'reload'
          post 'confirm'
          post 'back'
          get 'done'
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
  
  resources :notifications, only: [:update]
  
  namespace :admin do
    root to: 'admin/homes#top'
    resources :comments, only: [:index, :destroy]
    resources :groups, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :boards, only: [:index, :show, :destroy] 
    end
    resources :users, only: [:index, :show, :edit, :update]
  end
end