class AddLoginProviderToUser < ActiveRecord::Migration
  def change
    add_column :users, :login, :string
    add_column :users, :provider, :string
  end
end
