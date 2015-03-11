class SessionsController < ApplicationController
  before_action :redirect_if_logged_in, except: [:destroy]

  def new
    @class_wrapper = 'with-background'
    @class_inner_wrapper = 'inner-with-background'
    render layout: 'centered'
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to goals_path
    else
      flash.now[:error] = "Login incorrect."
      @class_wrapper = 'with-background'
      @class_inner_wrapper = 'inner-with-background'
      render :new, layout: 'centered'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
