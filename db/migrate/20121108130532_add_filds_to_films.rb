class AddFildsToFilms < ActiveRecord::Migration
  def change
    add_column :films, :directed_by, :string
    add_column :films, :length, :string
    add_column :films, :country, :string
  end
end
