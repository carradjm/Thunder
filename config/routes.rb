Thunder::Application.routes.draw do
  root to: "static_pages#root"
  
  resources :users do
    post 'follow', to: 'user_follows#create'
    delete 'follow', to: 'user_follows#destroy'
  end
  resources :songs, only: [:new, :create, :destroy, :show, :index] do
    post 'like', to: 'song_likes#create'
    delete 'like', to: 'song_likes#destroy'
    post 'comment', to: "comments#create"
  end
  resources :playlists do
    post 'songs', to: 'playlist_songs#create'
    delete 'songs', to: 'playlist_songs#destroy'
  end
  
  resources :genres, only: [:index, :show] 
  
  resources :notifications, only: [:index, :show]
  
  resource :playlist_song, only: [:new]
  
  resource :session, only: [:new, :create, :destroy]
  
  namespace :api, :defaults => { format: :json } do
    root to: "sessions#new"
    resources :users do
      post 'follow', to: 'user_follows#create'
      delete 'follow', to: 'user_follows#destroy'
    end
    resources :songs, only: [:new, :create, :destroy, :show, :index] do
      post 'comment', to: "comments#create"
    end
    resources :playlists
  
    resources :genres, only: [:index, :show] 
  
    resources :notifications, only: [:index, :show]
  
    resources :playlist_song, only: [:index, :new, :create, :destroy]
    
    resources :song_likes, only: [:index, :create, :destroy]
  
    resource :session, only: [:new, :create, :destroy]
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
