Rails.application.routes.draw do
  root 'static_pages#top'
  get 'static_pages/login'
end
