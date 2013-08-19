MeatApp2::Application.routes.draw do

  root :to => 'sessions#new'
  resources :users do
    resources :companies, :only => [:show]
  end
  
  resources :companies do 
    resources :suppliers
    resources :inventories, :orders do
      collection do
        get 'supplier_list'
      end
    end
  end

  resources :suppliers, :only => :none do
    resources :products
    resources :order_days
    resources :inventories, :orders do
      collection do
        put 'update_supplier_line'
      end
    end
  end

  get 'signup' => 'users#new'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  get 'signout' => 'sessions#destroy'
end
