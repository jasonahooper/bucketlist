BucketList::Application.routes.draw do
  resources :to_dos, :only => [:index]
  resources :destinations do
    resources :to_dos
  end
  root to: 'home#index'
end
