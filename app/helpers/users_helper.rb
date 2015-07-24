module UsersHelper

  # cache = ActiveSupport::Cache::MemoryStore.new
  #
  # cache.read('city')   # => nil
  # cache.write('city', "Duckburgh")
  # cache.read('city')   # => "Duckburgh"


  # checks the sesion id and gets the current user
  # or redirects to the home_path
  #
  # returns @user or redirects
  def current_user
    if session_id
      @user = User.find(session_id)
    else
      clear_session
      redirect_to home_path
    end 
  end 
  
  # set user if available
  #
  # returns a user
  def set_user_if_available    
    if session_id
      @user = User.find(session_id)
    else
      @user = User.new
    end
  end
  
  # checks if this user matches the session's user
  #
  # returns a Boolean
  def this_user?
    @user.id == session_id
  end
  
  # returns the sesion id
  #
  # returns an Integer or nil
  def session_id
    session[:id]
  end

  # clears the session
  #
  # returns nils
  def clear_session
    session.clear
  end
  
  # sets the session
  #
  # returns the session
  def set_session
    session[:id] = @user.id
  end
  
  # saves the user and sets the session to this user
  #
  # returns the sesion
  def save_user_and_set_session
    @user.save
    set_session
  end
  
  # finds this email address and returns a User object
  #
  # returns a user object
  def find_user_by_email
    @user = User.where("email" => params["users"]["email"]).first
    if @user == nil
      @user = User.new
    end
  end

end
