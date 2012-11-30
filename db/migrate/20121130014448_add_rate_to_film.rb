class AddRateToFilm < ActiveRecord::Migration
  def change
    add_column :films, :rate, :float
  end
end
