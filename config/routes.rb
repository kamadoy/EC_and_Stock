Rails.application.routes.draw do


  namespace :store do
    get 'items/index'
    get 'items/show'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, controllers: {
  registrations: "admin/registrations",
  sessions: "admin/sessions"
}

# 店舗用
# URL /store/sign_in ...
devise_for :store, controllers: {
  registrations: "store/registrations",
  sessions: "store/sessions"
}

 root to: 'public/homes#top'

  scope module: :public do

    get '/about' => 'homes#about', as: 'about'
    get 'customers/unsubsrib'=> 'customers#unsubsrib', as: 'unsubsrib'
    patch 'customers/withdraw'=> 'customers#withdraw', as: 'withdraw'
    delete '/cart_items/:id/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
    resources :items do
    collection do
      get 'search'
    end
  end
    resources :cart_items,only: [:index,:create,:update,:destroy]
    resources :addresses,only: [:index,:edit,:create,:destroy,:update]
    resources :customers,only: [:show,:edit,:update]
    resources :items,only: [:index,:show]
 
    post 'orders/confirm' => 'orders#confirm', as: 'confirm'
    get 'orders/thanks' => 'orders#thanks', as: 'thanks'
    resources :orders,only: [:new,:create,:index,:show]

  end

  namespace :admin do
   resources :items,only: [:new,:create,:index,:show,:edit,:update]
   resources :genres,only: [:create,:index,:edit,:update]
   resources :customers,only: [:show,:index,:edit,:update]
   resources :order_details,only: [:show,:update]
   resources :stores,only: [:new,:create,:index,:show,:edit,:update,:destroy]
   resources :stocks,only: [:new,:create,:index,:show,:edit,:update,:destroy]
   get '/'=> 'homes#top', as: 'top'
  
    #get 'homes/top'


   # get 'homes/about' => 'homes#about', as: 'about'
  end
  
  namespace :store do
       resources :stores,only: [:index,:show,:edit,:update,:destroy]
       resources :items,only: [:index,:show]
  end
end
