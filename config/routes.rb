BucketList::Application.routes.draw do
  resources :destinations
  resources :to_do
  root to: 'home#index'
end
