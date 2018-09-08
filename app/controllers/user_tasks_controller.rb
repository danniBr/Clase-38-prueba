class UserTasksController < ApplicationController
	before_action :authenticate_user!
  def create
  	@task = Task.find(params[:task_id])
  	@user_tasks = UserTask.new(user: current_user, task: @task, status: true)

    if @user_tasks.save
      redirect_to root_path, notice: 'Se ha completado la tarea'
#      @user_tasks.update_attribute(:status, true)
    else
      redirect_to root_path, alert: 'No se ha completado la tarea'
    end
  end
end
