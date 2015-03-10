class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: [:destroy]

  def new
    render layout: 'centered'
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to goals_path
    else
      flash.now[:error] = "Login incorrect."
      render :new, layout: 'centered'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
