class AddOrderToNews < ActiveRecord::Migration
  def change
    add_column :news, :order, :boolean
  end
end
