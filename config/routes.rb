Conradbastable::Application.routes.draw do

  resources :static_pages
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts

  root to: 'static_pages#home'
  match "/blog", to: "posts#index", as: :blog
  match "/blog/new", to: "posts#new", as: :new_post
  match "/blog/:permalink", to: "posts#show", as: :show_post
  match "/blog/:permalink/edit", to: "posts#edit", as: :edit_blog

end
