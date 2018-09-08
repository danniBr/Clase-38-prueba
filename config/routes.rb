Rails.application.routes.draw do
  resources :tasks do
    resources :user_tasks, only: :create
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  get 'home/index'
  get 'user_tasks/index'
  delete 'tasks/:task_id/user_tasks/:user_task_id', to: 'user_tasks#delete', as: 'delete_user_task'

  root to: 'tasks#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
