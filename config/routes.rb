Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  resources :publications do
    resources :comments, only: [:create, :destroy]
  end

  get 'user_comments', to: 'comments#user_comments'

  root to: "publications#index"
end
