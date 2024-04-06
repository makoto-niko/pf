Rails.application.routes.draw do
 devise_for :admin, controllers: {
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

    namespace :public, path: '' do
    resources :users do
      collection  do
        get :unsubscribe
        patch :withdraw
      end
    end
    resources :groups, only: [:index, :show] do
      resources :boards
      #resources :board_posts, only: [:index, :show, :create, :update, :destroy]
    end
    
    resources :board_comments, only: [:index, :create, :destroy]
  end


  namespace :admin do
    root to: 'homes#top'
    resources :groups, only: [:index, :show, :edit, :create, :update, :destroy] do
      resources :board, only: [:index, :show, :destroy] do
        resources :board_comments, only: [:index, :destroy]
      end
    end
    resources :users, only: [:index, :show, :edit, :update]
  end
end