Rails.application.routes.draw do
  devise_for :users,path: '', path_names: {
    registration: 'sign_up'
  },
  controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }

  namespace :api do
    namespace :v1 do
      resources :houses, only: [:index, :show, :create, :destroy] do
        resources :reservations, only: [:index, :show, :create, :destroy]
      end
      get 'reservations', to: 'reservations#index_user_reservations'
    end
  end

  get '/member-data', to: 'members#show'
  get '/members', to: 'members#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  delete '/users/sign_out', to: 'users/sessions#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
