class AddOverdraftLimitToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :overdraft_limit, :integer, :null => false, :default => 0
  end

  def self.down
    remove_column :accounts, :overdraft_limit
  end
end
