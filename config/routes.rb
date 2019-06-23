Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  post 'auth/register', to: 'adminapis#register'
  post 'auth/login', to: 'adminapis#login'
  get 'test', to: 'adminapis#test'

  resources :users do
    resources :tags
  end
end
