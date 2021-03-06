Rails.application.routes.draw do
  
  get 'users/new', to: "users#new"
  
  resource :my, only: %i(show)
  get 'mies/show', to: "mies#show"
  
  root 'application#hello'
  get 'sample', to: 'sample#index"'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/sign_up', to: 'mies#show'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }


  # マイページのルーティング
  get 'users/:id/profile', to: 'users#show', as: 'user_profile'
  # トップページのルーティング

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end


  resources :contacts, only: [:new, :create]
    post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
    post 'contacts/back', to: 'contacts#back', as: 'back'
    get 'done', to: 'contacts#done', as: 'done'
end

