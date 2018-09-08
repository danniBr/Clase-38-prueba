class UserTasksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_tasks = current_user.user_tasks
  end

  def create
  	@task = Task.find(params[:task_id])
  	@user_tasks = UserTask.new(user: current_user, task: @task, status: true)

    if @user_tasks.save
      redirect_to root_path, notice: 'Se ha completado la tarea'
    else
      redirect_to root_path, alert: 'No se ha completado la tarea'
    end
  end

  def delete
    @task = Task.find(params[:task_id])
    @user_task = UserTask.find_by(user: current_user, task: @task)

    @user_task.delete

    redirect_to root_path, notice: 'Tarea no completada'
  end
end
