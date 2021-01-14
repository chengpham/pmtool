Rails.application.routes.draw do
  root :to => "home#index"
  get("/home", {to: "home#index"})
  get("/about", {to: "about#index"})

  resources :projects do
    resources :tasks, only:[:create, :update, :destroy]
    resources :discussions, only:[:create, :destroy] do
      resources :comments, only:[:create, :destroy]
    end
  end

end
