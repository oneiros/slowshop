Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  get 'categories/index'
  resource :session

  resources :categories
  resources :products

  root to: "home#index"
end
