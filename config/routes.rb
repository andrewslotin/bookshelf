Bookshelf::Application.routes.draw do
  root to: 'reviews#index'

  resources :reviews
end
