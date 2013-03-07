class AddFrandlyNameToNews < ActiveRecord::Migration
  def change
    add_column :news, :frandly_name, :string
  end
end
