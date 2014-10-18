Rails.application.routes.draw do

  mount_devise_token_auth_for 'User', at: '/api/v1/auth'

  ActiveAdmin.routes(self) do
    resources :dashboard
  end

  namespace :api, defaults: {format: 'json'}, :path => "api" do
    namespace :v1 do
      resources :events
      resources :resource_categories
      resources :resources
      resources :startups
    end
  end

  get "meetup/getEvents"
  get "eventbrite/getEvents"
  
  root :to => 'home#index'

  # Angular catch all to allow page refresh
  get '*page' => "home#index"

end