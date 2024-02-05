Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get 'terms_of_service', to: 'static_pages#terms_of_service'
  get 'privacy_policy', to: 'static_pages#privacy_policy'

  resources :users, only: %i[new create]
  resource :profile, only: %i[show edit update]

  resources :pens do
    resources :favorite_pens, only: %i[create destroy]
  end
  resources :favorite_pens, only: :index
  
  resources :inks do
    resources :favorite_inks, only: %i[create destroy]
  end
  resources :favorite_inks, only: :index
  
  namespace :mypage do
    resources :pens, only: :index
    resources :inks, only: :index
  end
end
