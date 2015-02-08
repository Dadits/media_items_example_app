Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  
  resources :media_items do
    get :load_item_view, on: :collection
  end
end
