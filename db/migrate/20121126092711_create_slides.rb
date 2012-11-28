class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :image
      t.boolean :is_show

      t.timestamps
    end
  end
end
