Rails.application.routes.draw do
  resources :startups

  mount_devise_token_auth_for 'User', at: '/auth'
  
  root :to => 'home#index'

end