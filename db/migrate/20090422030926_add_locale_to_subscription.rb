class AddLocaleToSubscription < ActiveRecord::Migration
  def self.up
    add_column :subscriptions, :locale, :string, :limit => 5
  end

  def self.down
    remove_column :subscriptions, :locale
  end
end
