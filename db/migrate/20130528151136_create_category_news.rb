class CreateCategoryNews < ActiveRecord::Migration
  def change
    create_table :category_news do |t|
      t.string :name

      t.timestamps
    end
  end
end
