Bookshelf::Application.routes.draw do
  root to: 'reviews#index'

  resources :reviews
  resources :books, only: [:update]
  
  get '/feed' => 'reviews#feed', as: :feed, defaults: { format: 'atom' }
end
