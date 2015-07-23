class UsersController < ApplicationController
  
  # get "/login" => 'users#login', as: :login
  # get "/users" => 'users#index', as: :users
  # get "/users/new" => 'users#new', as: :new_user
  # post "/users/new" => 'users#create'
  # get "profile/edit" => 'users#edit', as: :edit_profile
  # put "profile/edit" => 'users#update'
  # delete "profile" => 'users#delete'
  # get "/profile" => 'users#profile', as: :profile
  # get "/users/:id" => 'users#show', as: :user     #identical to profile, except you're not logged in
  
  
  def login
    clear_session
    @user = User.new
  end
  
  def login_check
    find_user_by_email
    if @user.valid_password?(params["users"]["password"])
      set_session
      redirect_to profile_path
    else
      render "login"
    end
  end
  
  # show all records
  def index
    set_user_if_available
    @users = User.all
  end
  
  # look at form to create a new record
  def new
    @user = User.new
  end
  
  # receive form to create a new record
  def create
    @user = User.new(params_permitted)
    if @user.save
      set_session
      redirect_to profile_path
    else
      render "new"
    end
  end
  
  # see a form to update a single record
  def edit
    current_user
  end
  
  # update a single record from form
  def update
    current_user
    if @user.update(params_permitted)
      redirect_to profile_path
    else
      render "edit"
    end
  end
  
  # delete this record and all its associations
  def destroy
    current_user
    if @user.delete
      clear_session
      redirect_to users_path
    else
      redirect_to profile_path
    end
  end
  
  # show a single record
  def show
    set_user_if_available
    if params[:id].blank?
      @this_user = @user
    else
      @this_user = User.find(params[:id])
    end
  end
  
  private
  def params_permitted
    params["user"].permit(:email, :name, :password)
  end
  
end
