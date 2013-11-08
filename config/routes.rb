BucketList::Application.routes.draw do
  resources :destinations do
    resources :to_dos
  end
  root to: 'home#index'
end
