class UserTasksController < ApplicationController
	before_action :authenticate_user!
  def create
  	@task = Task.find(params[:task_id])
  	@user_tasks = UserTask.new(user: current_user, task: @task)
    
    if @user_tasks.save
      redirect_to root_path, notice: 'Se ha asignado el proyecto'
    else
      redirect_to root_path, alert: 'No se ha podido asignar'
    end
  end
end
