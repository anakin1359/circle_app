Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact',          to: 'static_pages#contact'
  get  '/events/scheduler', to: 'events#scheduler'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
  }

  resources :users, only: [:index, :show, :destroy] do
    resources :events,  only: [:show]
    resources :entries, only: [:index, :show, :destroy]
  end

  resources :events do
    collection do
      get 'search'
    end
    resources :entries, only: [:new, :create]
  end
end
