class ApplicationMailer < ActionMailer::Base
  default from: "noreply@uphill.com"

  def registration_email(user)
    @user = user
    mail(to: @user.email, subject: "Welcome Uphill")
  end

  def checkin_email(checkin)
    @checkin = checkin
    mail(to: checkin.user.email, subject: "Uphill: #{checkin.goal.title.titleize}")
  end

end
