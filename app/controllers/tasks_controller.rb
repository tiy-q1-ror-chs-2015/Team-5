class TasksController < ApplicationController
  def index
    @calendar = Calendar.find params[:calendar_id]
    @tasks = @calendar.tasks
  end

  def new
    @calendar = Calendar.find params[:calendar_id]
    @task = @calendar.tasks.new
  end

  def create
    @calendar = Calendar.find params[:calendar_id]
    @task = @calendar.tasks.create task_params
    if @task.save
      flash[:notice] = 'Task was successfully created'
      redirect_to calendar_tasks_path
    else
      flash[:error] = 'Task was NOT saved.'
      render :new
    end
  end

  def show
    @calendar = Calendar.find params[:calendar_id]
    @task = @calendar.tasks.find params[:id]
  end

  def edit
    @calendar = Calendar.find params[:calendar_id]
    @task = @calendar.tasks.find params[:id]
  end

  def update
    @calendar = Calendar.find params[:calendar_id]
    @task = @calendar.tasks.find params[:id]
    @task.update_attributes task_params
    redirect_to calendar_task_path
  end

  def destroy
    @calendar = Calendar.find params[:calendar_id]
    @task = @calendar.tasks.find params[:id]
    @task.destroy
    redirect_to calendar_path(@calendar)
  end

  private
  def task_params
    params.require(:task).permit(
      :date,
      :title,
      :misc,
      :completed
    )
  end
end

