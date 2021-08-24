Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact',       to: 'static_pages#contact'
  # get  '/entries/index', to: 'entries#index'

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
  }

  resources :users, only: [:index, :show, :destroy] do
    resources :events,  only: [:show]
    resources :entries, only: [:index]
  end

  resources :events do
    resources :entries, only: [:new, :create, :show]
  end
end
