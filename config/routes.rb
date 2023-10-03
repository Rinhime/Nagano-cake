Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in...
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    post "/orders/confirm" => "orders#confirm"
    get "/orders/finish" => "orders#finish"
    resources :orders, only: [:new, :create, :index, :show]
    resources :items, only: [:index, :show]
    # resources :customers, only: [:show, :edit, :update]
    get "/customers/show" => "customers#show"
    get "/customers/show/eidt" => "customers#edit"
    patch "/customers/show" => "customers#update"
    get "/customers/check" => "customers#check"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :cart_items, only: [:index, :create, :update]
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    delete "/cart_items/:id" => "cart_items#destroy"
  end
  
  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    get "/homes" => 'homes#top'
    resources :items, only: [:new, :create, :index, :show, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show]
  end
  
  get "/about" => "homes#about", as: "about"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
