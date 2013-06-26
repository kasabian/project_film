class AddHarakterToUser < ActiveRecord::Migration
  def change
    add_column :users, :harakter, :text
  end
end
