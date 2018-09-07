Rails.application.routes.draw do
  get 'user_tasks/create'

  resources :tasks do
  	resources :user_tasks, only: :create
  end
  get 'home/index'

  devise_for :users, controllers: {
        registrations: 'users/registrations'
      }

  root to: "tasks#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
