class AddTagToFilm < ActiveRecord::Migration
  def change
    add_column :films, :tag, :string
  end
end
