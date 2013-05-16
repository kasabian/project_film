class AddUserIdToFilm < ActiveRecord::Migration
  def change
    add_column :films, :user_id, :integer
  end
end
