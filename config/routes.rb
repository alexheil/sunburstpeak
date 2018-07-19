Rails.application.routes.draw do
  
  root "static_pages#home"

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy', path: 'sign-out'
  end

  resources :users, controller: 'users/users', only: :show do
    member do
      get 'day'
      get 'week'
      get 'month'
    end
  end
  
end
