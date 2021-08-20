Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/edit'
  root 'static_pages#home'

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
  get  '/contact', to: 'static_pages#contact'
end
