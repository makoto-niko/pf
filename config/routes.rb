Rails.application.routes.draw do
  
  namespace :admin do
    get 'homes/top'
  end
  namespace :admin do
    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
  end
  namespace :admin do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :admin do
    get 'board_comments/index'
    get 'board_comments/delete'
  end
  namespace :admin do
    get 'board_posts/index'
    get 'board_posts/show'
    get 'board_posts/delete'
  end
  namespace :admin do
    get 'groups/index'
    get 'groups/show'
    get 'groups/create'
    get 'groups/update'
    get 'groups/delete'
  end
  namespace :admin do
    get 'comments/index'
    get 'comments/delete'
  end
  namespace :admin do
    get 'posts/delete'
  end
  namespace :public do
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'
    get 'customers/unsubscribe'
    get 'customers/withdraw'
  end
  namespace :public do
    get 'sessions/new'
    get 'sessions/create'
    get 'sessions/destroy'
  end
  namespace :public do
    get 'registrations/new'
    get 'registrations/create'
  end
  namespace :public do
    get 'board_comments/index'
    get 'board_comments/create'
    get 'board_comments/delete'
  end
  namespace :public do
    get 'board_posts/index'
    get 'board_posts/show'
    get 'board_posts/create'
    get 'board_posts/update'
    get 'board_posts/delete'
  end
  namespace :public do
    get 'groups/index'
    get 'groups/show'
    get 'groups/create'
    get 'groups/update'
    get 'groups/delete'
  end
  namespace :public do
    get 'comments/index'
    get 'comments/create'
    get 'comments/delete'
  end
  namespace :public do
    get 'posts/index'
    get 'posts/show'
    get 'posts/create'
    get 'posts/update'
    get 'posts/delete'
  end
  namespace :public do
    get 'users/index'
    get 'users/show'
    get 'users/create'
    get 'users/update'
    get 'users/delete'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
