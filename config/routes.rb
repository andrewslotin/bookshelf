Bookshelf::Application.routes.draw do
  root to: 'reviews#index'

  resources :reviews
  get '/feed' => 'reviews#feed', as: :feed, defaults: { format: 'atom' }
end
