class AddFRateToFilm < ActiveRecord::Migration
  def change
    add_column :films, :f_rate, :float
  end
end
