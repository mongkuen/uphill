class PagesController < ApplicationController
  def passthrough
    if logged_in?
      redirect_to goals_path
    else
      render :home, layout: 'centered'
    end
  end

  def home
  end

end
