module UsersHelper

  # cache = ActiveSupport::Cache::MemoryStore.new
  #
  # cache.read('city')   # => nil
  # cache.write('city', "Duckburgh")
  # cache.read('city')   # => "Duckburgh"

  def current_user
    if session_id
      @user = User.find(session_id)
    else
      clear_session
      redirect_to home_path
    end 
  end 

  def set_user_if_available    
    if session_id
      @user = User.find(session_id)
    else
      @user = User.new
    end
  end

  def session_id
    session[:id]
  end

  def clear_session
    session[:id] = nil
  end
  
  def set_session
    session[:id] = @user.id
  end
  
  def save_user_and_set_session
    @user.save
    set_session
  end

  def find_user_by_email
    @user = User.where("email" => params["users"]["email"]).first
    if @user == nil
      @user = User.new
    end
  end

end
