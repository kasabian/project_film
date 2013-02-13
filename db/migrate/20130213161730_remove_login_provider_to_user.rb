class RemoveLoginProviderToUser < ActiveRecord::Migration
  def up
    remove_column :users, :login
    remove_column :users, :provider
  end

  def down
    add_column :users, :provider, :string
    add_column :users, :login, :string
  end
end
