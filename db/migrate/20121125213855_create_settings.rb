class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :site_name
      t.string :tegs
      t.integer :count_page

      t.timestamps
    end
  end
end
