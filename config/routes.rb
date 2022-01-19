Rails.application.routes.draw do
  devise_for :users
  root 'application#hello'
  get 'sample', to: 'sample#index"'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  devise_scope :users do
    get '/users', to: redirect("/users/sign_up")
  end

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
