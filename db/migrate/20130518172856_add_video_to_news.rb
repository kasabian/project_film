class AddVideoToNews < ActiveRecord::Migration
  def change
    add_column :news, :video, :string
  end
end
