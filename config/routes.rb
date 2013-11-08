BucketList::Application.routes.draw do
  resources :destinations
  resources :to_dos
  root to: 'home#index'
end
