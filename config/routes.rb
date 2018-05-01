Rails.application.routes.draw do

  devise_for :users, controllers: { registrations: "registrations" }

  resources :products do
    resources :comments
  end

  resources :users

  resources :orders, only: [:index, :show, :create, :destroy]

  post 'simple_pages/thank_you'

  get 'simple_pages/landing_page'
  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'payments/create'

  root 'simple_pages#landing_page'

end
