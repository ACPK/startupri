Rails.application.routes.draw do
  
  namespace :api, defaults: {format: 'json'}, :path => "api" do
    namespace :v1 do
      resources :startups
    end
  end

  mount_devise_token_auth_for 'User', at: '/auth'
  
  root :to => 'home#index'

  # Angular catch all to allow page refresh
  get '*page' => "home#index"

end