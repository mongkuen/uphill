class PagesController < ApplicationController
  def passthrough
    if logged_in?
      redirect_to goals_path
    else
      @class_wrapper = 'with-background'
      @class_inner_wrapper = 'inner-with-background'
      render :home, layout: 'centered'
    end
  end

  def home
  end

end
