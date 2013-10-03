class AddRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :string, default: 'user'
    add_column :users, :username, :string, :default => 'default'

  end
end
