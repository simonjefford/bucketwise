desc "Reset the database and setup with a fresh user and subscription"
task :nuke => :environment do
  Rake::Task["db:reset"].invoke
  user = User.create(
    :name => "user", 
    :email => "someone@example.com",
    :user_name => "user",
    :password => "password")
  ENV['USER_ID'] = user.id.to_s
  ENV['LOCALE'] = 'en-UK'
  Rake::Task["subscription:create"].invoke
end
