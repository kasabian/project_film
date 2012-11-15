class AddTypeIdToFilm < ActiveRecord::Migration
  def change
    add_column :films, :type_id, :integer
  end
end
