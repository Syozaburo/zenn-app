Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :tasks, only: :index
      resources :todos, only: [:index, :create, :destroy]
    end
  end
end
