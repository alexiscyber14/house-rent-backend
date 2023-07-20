Rails.application.routes.draw do
  devise_for :users,path: '', path_names: {
    registration: 'sign_up'
  },
  controllers: {
      registrations: 'users/registrations',
      sessions: 'users/sessions'
  }

  get '/member-data', to: 'members#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
