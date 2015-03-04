desc "Heroku scheduler tasks"
task :email_test => :environment do
  puts "Sending email"
  # WelcomeMailer.welcome_email(User.find(19)).deliver_now
  # ActionMailer::Base.mail(:from => "test@uphill.com", :to => "mongkuen.sun@gmail.com", :subject => "test", :body => "test").deliver
  WelcomeMailer.welcome_email(User.find(20)).deliver_now
  puts "Emails sent..?"
end
