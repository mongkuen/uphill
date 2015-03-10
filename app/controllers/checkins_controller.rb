class CheckinsController < ApplicationController
  before_action :set_goal
  before_action :user_required, except: [:checkin]
  before_action except: [:checkin] do
    deny_access(@goal)
  end

  def update
    if ["up", "down", "none"].include?(params[:checkin])
      @goal = Goal.find(params[:id])
      @checkin = @goal.checkins.last
      @checkin.update(status: params[:checkin])

      respond_to do |format|
        format.html do
          flash[:notice] = "Check-In Logged!"
          redirect_to root_path
        end
        format.js
      end

    else
      flash[:error] = "That's not allowed."
      redirect_to root_path
    end
  end

  def checkin
    if ["up", "down", "none"].include?(params[:v]) && Checkin.find_by(token: params[:t])
      @checkin = Checkin.find_by(token: params[:t])
      @checkin.update(status: params[:v])
      flash[:notice] = "Check-in recorded!"
      redirect_to login_path
    else
      flash[:error] = "That's not a valid check-in."
      redirect_to login_path
    end
  end

  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

end
