Rails.application.routes.draw do

  namespace :admin do
    resources :restaurants, only: [ :update, :destroy, :edit]
    resources :reviews, only: [ :update, :destroy, :edit ]
  end

  resources :restaurants, except: [ :update, :destroy, :edit ] do
    resources :reviews, only: [ :new, :create]
  end

  root to: "restaurants#index"
end
