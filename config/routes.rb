Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :registered_applications, only: [:index, :new, :create, :show, :destroy]

end
