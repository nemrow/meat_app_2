MeatApp2::Application.routes.draw do

  root :to => 'sessions#new'
  resources :users do
    resources :companies, :only => [:show]
  end
  
  resources :companies do 
     resources :suppliers
  end

  resources :suppliers, :only => :none do
    resources :products
    resources :order_days
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
