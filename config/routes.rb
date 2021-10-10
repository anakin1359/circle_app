Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact',          to: 'static_pages#contact'
  get  '/about',            to: 'static_pages#about'
  get  '/events/scheduler', to: 'events#scheduler'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
  }

  resources :users, only: [:index, :show, :destroy] do
    resources :events,  only: [:show]
    resources :entries, only: [:index, :show, :destroy] do
      resources :posts, only: [:index, :create]
    end
    get '/search_entries', to: 'entries#search'
  end

  resources :events do
    collection do
      get 'search'
    end
    resources :entries, only: [:new, :create]
  end
end
