class AddFilmIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :film_id, :integer
  end
end
