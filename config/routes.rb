BucketList::Application.routes.draw do
  resources :to_dos, :only => [:index, :destroy]
  resources :destinations do
    resources :to_dos, :except => [:destroy]
  end
  root to: 'home#index'
end
