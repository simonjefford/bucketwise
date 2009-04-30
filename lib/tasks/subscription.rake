namespace :subscription do
  desc "List all users for a particular subscription (SUBSCRIPTION_ID env var)"
  task :users => :environment do
    subscription = Subscription.find(ENV['SUBSCRIPTION_ID'])

    if subscription.users.empty?
      puts "No users have access to subscription ##{subscription.id}"
    else
      puts "Users with access to ##{subscription.id}"
      subscription.users.each do |user|
        puts "##{user.id}: \"#{user.name}\" <#{user.email}>"
      end
    end
  end

  desc "Create a new subscription (USER_ID env var for owner, optional LOCALE env var)"
  task :create => :environment do
    owner = User.find(ENV['USER_ID'])
    subscription = Subscription.create(:owner => owner, :locale => ENV['LOCALE'])
    owner.subscriptions << subscription
    puts "subscription ##{subscription.id} created for #{owner.user_name}"
  end

  desc "Set locale for subscription (SUBSCRIPTION_ID env var)"
  task :locale => :environment do
    subscription = Subscription.find(ENV['SUBSCRIPTION_ID'])
    subscription.update_attributes!(:locale => ENV['LOCALE'])
  end
end
