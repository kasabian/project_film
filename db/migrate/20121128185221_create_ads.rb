class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :image
      t.string :url
      t.string :title
      t.string :name

      t.timestamps
    end
  end
end
