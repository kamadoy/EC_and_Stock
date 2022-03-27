Rails.application.routes.draw do

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

  namespace :admin do
   resources :items,only: [:new,:create,:index,:show,:edit,:update]
   resources :genres,only: [:create,:index,:edit,:update]
   resources :customers,only: [:show,:index,:edit,:update]
   resources :order_details,only: [:show,:update]
   resources :stores,only: [:new,:create,:index,:show,:edit,:update,:destroy]
   get '/'=> 'homes#top', as: 'top'
    #get 'homes/top'


   # get 'homes/about' => 'homes#about', as: 'about'
  end
end
