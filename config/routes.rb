Rails.application.routes.draw do
  devise_for :users
  root to: "miniblogs#index"
  resources :miniblogs do
    resources :comments, only: :create
  end
  resources :users, only: :show
end