Rails.application.routes.draw do
  root :to => "home#index"
  get("/home", {to: "home#index"})
  get("/about", {to: "about#index"})

  resources :projects
  resources :tasks
  resources :comments
  resources :discussions

end
