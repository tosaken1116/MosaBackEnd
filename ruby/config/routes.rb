Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "hello/view", to: "hello#view"
  get "group/:id", to: "group#show"
  put 'group/:id', to: 'group#update'
  # Defines the root path route ("/")
  # root "articles#index"
end
