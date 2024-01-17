Rails.application.routes.draw do
  root 'static_pages#top'
  get 'static_pages/login'
  get 'static_pages/signup'
  get 'static_pages/mypage'
  get 'static_pages/mypageedit'
  get 'static_pages/result'
  get 'static_pages/inkshow'
  get 'static_pages/inkedit'
  get 'static_pages/pencase'
end
