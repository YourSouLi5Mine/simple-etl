Rails.application.routes.draw do
  get 'user/index'
  root 'user#index'
end
