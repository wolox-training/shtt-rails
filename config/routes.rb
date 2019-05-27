Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount_devise_token_auth_for 'User', at: '/api/v1/auth'
  namespace :api do
    namespace :v1 do
      resources :books, only: [:index, :show]
      resources :users, only: [:index] do
        resources :rents, only: [:index, :create]
      end
      resources :book_suggestions, only: [:create]
      get 'open_library/:isbn', to: 'open_library#show'
    end
  end
end
