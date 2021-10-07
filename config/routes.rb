# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  unless Rails.env.production?
    mount Rswag::Ui::Engine => '/api-docs'
    mount Rswag::Api::Engine => '/api-docs'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  mount_devise_token_auth_for 'User',
    at: 'v1/users',
    controllers: {
      sessions: 'v1/users/sessions',
      registrations: 'v1/users/registrations',
      token_validations: 'v1/users/token_validations',
    }

  namespace :v1 do

    namespace :users do
      # users/endpoints

      resources :analytics, only: %i(index)
      resources :treasures, only: %i() do
        collection { post :hunt }
      end
      resources :passwords, only: %i(create) do
        collection { put :update }
      end

  
    end
  end
end
