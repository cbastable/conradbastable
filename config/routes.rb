Conradbastable::Application.routes.draw do

  devise_for :users
  resources :static_pages
  resources :posts

  root to: 'static_pages#home'
  get "/blog", to: "posts#index", as: :blog
  get "/blog/new", to: "posts#new"
  get "/blog/:permalink", to: "posts#show", as: :show_post
  get "/blog/:permalink/edit", to: "posts#edit", as: :edit_blog
  get "/about", to: "static_pages#about", as: :about

end
