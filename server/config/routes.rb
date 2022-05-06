Rails.application.routes.draw do
  root :to => "home#index"
  get("/home", {to: "home#index"})
  get("/about", {to: "about#index"})

  resources :projects do
    resources :members, only: [:create, :destroy]
    resources :tasks, only:[:create, :update, :destroy]
    resources :discussions, only:[:create, :destroy] do
      resources :comments, only:[:create, :destroy]
    end
    resources :favourites, shallow: :true, only: [:create, :destroy]
  end
  resources :tags, only: [:index, :show]
  resources :favourites, only: [:index]
  resources :users, only:[:new, :create, :edit, :update, :destroy]
  resource :session, only:[:new, :create, :destroy]
  # resources :projects, only: [:new, :create, :show, :index, :edit, :update, :destroy]

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :projects, only:[:index, :show, :update, :create, :destroy]
      resource :session, only:[:create,:destroy]
    end
  end
end
