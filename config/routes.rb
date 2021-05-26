Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :links, only: %i[index create show destroy]
end
