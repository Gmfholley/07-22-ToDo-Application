module TasksHelper
  def this_users_task?
    @user.id == @task.user_id
  end
end
