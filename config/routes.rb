Rails.application.routes.draw do
  root to: 'users#index'
  resources :users, only: [:index, :show]
  resources :posts, only: :index
  resources :reports, only: :index do
    collection do
      get 'top-user-posts'
      get 'top-user-likes'
      get 'top-posts'
    end
  end
end
