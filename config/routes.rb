Rails.application.routes.draw do
  
  root "static_pages#home"
  get 'privacy' => 'static_pages#privacy'
  get 'terms' => 'static_pages#terms'
  get 'about' => 'static_pages#about'
  get 'faq' => 'static_pages#faq'
  get 'updates' => 'static_pages#updates'

  devise_for :users, controllers: { sessions: "users/sessions", passwords: "users/passwords", registrations: "users/registrations", confirmations: "users/confirmations",  unlocks: "users/unlocks"}

  devise_scope :user do
    get 'sign_out', to: 'users/sessions#destroy', path: 'sign-out'
    get 'sign_in', to: 'users/sessions#new', path: 'sign-in'
    get 'register', to: 'users/registrations#new'
  end

  resources :users, controller: 'users/users', only: :show do
    member do
      get 'day'
      get 'month'
    end
  end

  resources :cities, controller: 'cities/cities', except: :index do
    member do
      get 'day'
      get 'month'
    end
    resources :events, controller: 'events/events', except: [:index, :new, :create] do
      resources :rsvps, controller: 'users/rsvps', only: [:create, :destroy]
    end
    resources :things, controller: 'cities/things', path: 'things-to-do' do
      resources :likes, controller: 'users/likes', only: [:create, :destroy]
    end
    get 'free' => 'cities/things#free', path: 'free-things-to-do'
  end

  resources :events, controller: 'events/events', only: [:new, :create]
  resources :posts, controller: 'posts/posts'
  
end
