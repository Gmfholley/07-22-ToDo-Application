class TasksController < ApplicationController
  
  # show all records
  def index
    set_user_if_available
    @tasks = @user.tasks
  end
  
  # receive form to create a new record
  def create
    @task = Task.new(params_permitted)
    if @task.save
      redirect_to my_tasks_path, :notice => "Successfully added."
    else
      render "new"
    end
  end
  
  # look at form to create a new record
  def new
    current_user
    @task = @user.tasks.new()
  end
  
  # show a single record
  def show
    current_user
    set_task
  end
  
  # see a form to update a single record
  def edit
    current_user
    set_task
  end
  
  # update a single record from form
  def update
    current_user
    @task = Task.find(params["task"]["id"])
    if @task.user_id != @user.id
      redirect_to profile_path
    else 
      if @task.update(params_permitted)
        redirect_to my_tasks_path, :notice => "Successfully updated!"
      else
        render "edit"
      end
    end
  end
  
  # delete this record and all its associations
  def destroy
    current_user
    set_task
    if @task.destroy
      redirect_to my_tasks_path, :notice => "Successfully deleted."
    else
      redirect_to my_tasks_path, :notice => "Not able to delete."
    end
  end
  
  private
  def set_task
    if params[:id].blank?
      @task = Task.new(user_id: @user.id)
    else
      @task = Task.find(params[:id])
    end
  end
  
  def params_permitted
    params["task"].permit(:name, :completed, :user_id)
  end
  
end
