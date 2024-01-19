Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'
  
  resources :users, only: %i[new create]

  get 'static_pages/mypage'
  get 'static_pages/mypageedit'
  get 'static_pages/result'
  get 'static_pages/inkshow'
  get 'static_pages/inkedit'
  get 'static_pages/pencase'
end
