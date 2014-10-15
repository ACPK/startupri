Rails.application.routes.draw do
  
  # devise_for :admin_users, ActiveAdmin::Devise.config
  
  ActiveAdmin.routes(self)
  namespace :api, defaults: {format: 'json'}, :path => "api" do
    namespace :v1 do
      resources :events
      resources :resource_categories
      resources :resources
      resources :startups
    end
  end

  mount_devise_token_auth_for 'User', at: '/api/v1/auth'
  
  root :to => 'home#index'

  # Angular catch all to allow page refresh
  get '*page' => "home#index"

end