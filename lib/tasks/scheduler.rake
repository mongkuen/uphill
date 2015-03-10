desc "Heroku scheduler tasks"
task :goal_checkin_update => :environment do
  puts "Creating checkins"
  Goal.goal_checkin_update
  puts "Checkins updated, and emails sent"
end
