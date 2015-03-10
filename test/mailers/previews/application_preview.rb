class ApplicationMailerPreview < ActionMailer::Preview
  def registration_email
    ApplicationMailer.registration_email(User.first)
  end

  def checkin_email
    ApplicationMailer.checkin_email(Checkin.first)
  end
end
