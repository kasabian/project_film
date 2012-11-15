class AddImageToFilm < ActiveRecord::Migration
  def change
    add_column :films, :users, :string
    add_column :films, :image, :string
  end
end
