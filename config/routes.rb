Rails.application.routes.draw do
  # 顧客用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
  end

  scope module: :public do
    root :to => 'homes#top'
    get   'users/information'       =>  'users#show',   as: 'user'
    get   'users/information/edit', to: 'users#edit',   as: 'edit_user'
    patch 'users/information',      to: 'users#update', as: 'update_user'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
