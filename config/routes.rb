
Rails.application.routes.draw do

  resources :like_tweets

  resources :relationships

  resources :tweets, :except => :index 

  resources :users

  root to: 'users#login'
  match ':controller/:action', :via => [:get, :post]
  get 'user/logout', :to => "users#logout"
  get 'tweet_index', :to => "tweets#user_tweet"
  get 'user', :to => "users#show"
  # get 'user_tweet', :to => "tweets#user_tweet"
  get 'like_tweet', :to => "tweets#like_tweet"
  post 'like', :to => "like_tweets#like_tweet"
  post 'unlike', :to => "like_tweets#unlike"
  
  # get 'search', :to => "users#search"

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
