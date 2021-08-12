Rails.application.routes.draw do
  root 'static_pages#home'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
end
