class AddOrderToFilm < ActiveRecord::Migration
  def change
    add_column :films, :order, :boolean
  end
end
