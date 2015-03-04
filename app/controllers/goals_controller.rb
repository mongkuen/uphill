class GoalsController < ApplicationController
  before_action :user_required
  before_action :set_goal, except: [:index, :new, :create]

  def index
    @daily_goals = current_user.goals.where(schedule: "daily")
    @weekly_goals = current_user.goals.where(schedule: "weekly")
    @biweekly_goals = current_user.goals.where(schedule: "biweekly")
  end

  def new
    @goal = Goal.new
    render layout: 'centered'
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user = current_user

    if @goal.save
      flash[:notice] = "Summit created!"
      redirect_to root_path
    else
      render :new, layout: 'centered'
    end
  end

  # def show
  #   render layout: 'centered'
  # end

  def edit
    render layout: 'centered'
  end

  def update
    if @goal.update(goal_params)
      flash[:notice] = "Goal Updated!"
    else
      flash[:error] = "Something went wrong. Please try again."
    end
    redirect_to root_path
  end

  def destroy
    if @goal.destroy
      flash[:notice] = "Goal deleted."
      redirect_to root_path
    else
      redirect edit_goal_path(@goal)
    end
  end

  def checkin
    if ["up", "down", "none"].include?(params[:checkin])
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

  private
  def set_goal
    @goal = Goal.find(params[:id])
  end

  def goal_params
    params.require(:goal).permit(:body, :title, :schedule)
  end

end
