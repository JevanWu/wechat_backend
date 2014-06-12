HualiWechat::Application.routes.draw do

  root 'auto_replies#subscribe_reply'
  resources :assets
  resources :news_assets
  resources :news_asset_collections
  resources :image_assets

  get 'wechats', to: 'wechats#show'
  post 'wechats', to: 'wechats#create'

  get 'subscribe_reply', to: 'auto_replies#subscribe_reply', as: 'subscribe_reply'
  patch 'subscribe_reply/:id', to: 'auto_replies#update_subscribe_reply', as: 'update_subscribe_reply'
  get 'default_reply', to: 'auto_replies#default_reply', as: 'default_reply'
  patch 'default_reply/:id', to: 'auto_replies#update_default_reply', as: 'update_default_reply'
end
