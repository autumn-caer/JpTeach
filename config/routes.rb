Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'
  # APIコントローラへのルーティング
  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :employees, only: [:index, :show]
    end
  end
end
