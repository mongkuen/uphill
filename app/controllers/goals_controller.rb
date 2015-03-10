class GoalsController < ApplicationController
  before_action :user_required
  before_action :set_goal, except: [:index, :new, :create]
  before_action except: [:index, :new, :create] do
    deny_access(@goal)
  end

  def index
    @daily_goals = current_user.goals.where(schedule: "daily")
    @weekly_goals = current_user.goals.where(schedule: "weekly")
    @biweekly_goals = current_user.goals.where(schedule: "biweekly")
  end

  def new
    @goal = Goal.new
    @goal.notify = true
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
      flash[:notice] = "Summit Updated!"
    else
      flash[:error] = "Something went wrong. Please try again."
    end
    redirect_to root_path
  end

  def destroy
    if @goal.destroy
      flash[:notice] = "Summit deleted."
      redirect_to root_path
    else
      redirect edit_goal_path(@goal)
    end
  end

  private
  def set_goal
    if Goal.exists?(params[:id])
      @goal = Goal.find(params[:id])
    else
      flash[:error] = "That summit doesn't exist!"
      redirect_to root_path
    end
  end

  def goal_params
    params.require(:goal).permit(:body, :title, :schedule, :notify)
  end

end
