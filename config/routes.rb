Rails.application.routes.draw do
  devise_for :users
  root to: "miniblogs#index"
  resources :miniblogs, only: [:new,:create]
end
