Rails.application.routes.draw do
  
  root "static_pages#home"

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy', path: 'sign-out'
    get 'sign_in', to: 'users/sessions#new', path: 'sign-in'
    get 'register', to: 'users/registrations#new'
  end



  resources :users, controller: 'users/users', only: :show do
    member do
      get 'day'
      get 'week'
      get 'month'
    end
  end

  resources :cities, controller: 'cities/cities', except: :index do
    member do
      get 'day'
      get 'week'
      get 'month'
    end
    resources :events, controller: 'events/events', except: [:index, :new, :create] do
      resources :rsvps, controller: 'users/rsvps', only: [:create, :destroy]
    end
    resources :things, controller: 'cities/things' do
      member do
        get 'free'
      end
    end
  end

  resources :events, controller: 'events/events', only: [:new, :create] do
    member do
      get 'new_date_and_city'
      get 'new_no_city'
      get 'new_no_date'
    end
  end
  
end
