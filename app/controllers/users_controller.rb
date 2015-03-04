class UsersController < ApplicationController
  before_action :user_required, except: [:new, :create]

  def new
    @user = User.new
    render layout: 'centered'
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to goals_path
    else
      render :new, layout: 'centered'
    end
  end

  def show
    @user = current_user
  end

  def edit
    @user = current_user
    render layout: 'centered'
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = "Info updated."
      redirect_to edit_user_path(current_user)
    else
      render :edit, layout: 'centered'
    end
  end

  def cancel
    render layout: 'centered'
  end

  def destroy
    if current_user.authenticate(params[:password])
      user = User.find_by(id: current_user.id)
      user.destroy
      session[:user_id] = nil
      redirect_to root_path
    else
      flash[:error] = "Password does not match."
      redirect_to cancel_user_path(current_user)
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end

end
