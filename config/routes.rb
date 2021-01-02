Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'

  root to: 'home#index'
  resources :test_form_list, only: [:index, :show]

  # get '*path', to: 'home#redirect_to_root'

  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :test_form
      resources :test_form_header, only: [:index, :show]
      resources :employees, only: [:index, :show]
      resources :test_answer
      resources :result_header
      resources :result
      resources :user_search, only: [:index, :show]
      resources :user_page
      resources :user_edit
      resources :user_follow
      resources :user_photo, only: [:show]
    end
  #   mount_devise_token_auth_for 'User', at: 'auth', controllers: {
  #     registrations: 'api/auth/registrations'
  # }
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end
