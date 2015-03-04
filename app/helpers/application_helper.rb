module ApplicationHelper
  def present_name(user)
    user.name.nil? || user.name == "" ? user.email : user.name
  end

  def display_date(datetime)
    datetime.strftime("%b %dth, %Y")
  end

  def display_short_date(datetime)
    datetime.strftime("%m/%d/%y")
  end

  def display_day_of(datetime)
    datetime.strftime("%b %dth")
  end

  def display_percentage(goal)
    num = goal.percentage
    if num.nan?
      "0%"
    else
      (num * 100).to_i.to_s + "%"
    end
  end

  def display_checkin(goal)
    if goal.schedule == "daily"
      "For day: " + display_day_of(goal.checkins.last.created_at)
    elsif goal.schedule == "weekly"
      "For week: " + display_day_of(goal.checkins.last.created_at)
    else
      "For bi-week: " + display_day_of(goal.checkins.last.created_at)
    end
  end

  def new_checkin?(goal)
    goal.checkins.last.status.nil? ? true : false
  end

  def new_checkin_num
    current_user.checkins.where(status: nil).count
    # Checkin.joins(:goal).where('goal.user' == current_user).where(status: nil).count
  end

end
