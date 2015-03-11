class ErrorsController < ApplicationController
  def not_found
    @class_wrapper = 'with-background'
    @class_inner_wrapper = 'inner-with-background'
    render :not_found, layout: 'centered'
  end

  def server_error
    @class_wrapper = 'with-background'
    @class_inner_wrapper = 'inner-with-background'
    render :server_error, layout: 'centered'
  end
end
