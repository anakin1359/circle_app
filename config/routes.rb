Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
  }

  resources :users, only: [:index, :show, :destroy]
  resources :admins, only: [:index, :show, :destroy]
  resources :events
end
