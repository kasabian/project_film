class CreateUsersRoles < ActiveRecord::Migration
  def change
    create_table :users_roles do |t|
      t.references :user
      t.references :role

      t.timestamps
    end
    add_index :users_roles, :user_id
    add_index :users_roles, :role_id
  end
end
