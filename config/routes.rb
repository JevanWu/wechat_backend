HualiWechat::Application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'auto_replies#subscribe_reply'
  resources :assets
  resources :news_assets
  resources :news_asset_collections
  resources :image_assets

  resources :wechats, only: [:create, :show]

  get 'subscribe_reply', to: 'auto_replies#subscribe_reply', as: 'subscribe_reply'
  patch 'subscribe_reply/:id', to: 'auto_replies#update_subscribe_reply', as: 'update_subscribe_reply'
  get 'default_reply', to: 'auto_replies#default_reply', as: 'default_reply'
  patch 'default_reply/:id', to: 'auto_replies#update_default_reply', as: 'update_default_reply'
  get 'wechat/receiver', to: 'wechat#receiver'
  post 'wechat/receiver', to: 'wechat#receiver'
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
