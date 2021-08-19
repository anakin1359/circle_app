Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords'
  }

  devise_for :users, controllers: {
    sessions:      'users/sessions',
    passwords:     'users/passwords',
    registrations: 'users/registrations',
  }
  
  resources :admins, only: [:index, :show, :destroy]
  resources :users, only: [:index, :show, :destroy]
  get  '/contact', to: 'static_pages#contact'
end
