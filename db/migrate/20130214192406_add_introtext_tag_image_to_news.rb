class AddIntrotextTagImageToNews < ActiveRecord::Migration
  def change
    add_column :news, :introtext, :string
    add_column :news, :tag, :string
    add_column :news, :image, :string
  end
end
