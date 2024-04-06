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
    resources :customers, only: [:index, :show, :edit, :update]
  end
end