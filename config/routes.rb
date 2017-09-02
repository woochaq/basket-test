Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #
  devise_scope :user do
    root :to => 'devise/sessions#new'
  end

  get "basket", to: 'basket#index'
  resources :products, only: [:index] do
    get :add, on: :member
    get :remove, on: :member
  end
  resources :orders, only: [:index, :show]
end
