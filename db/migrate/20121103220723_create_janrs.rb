class CreateJanrs < ActiveRecord::Migration
  def change
    create_table :janrs do |t|
      t.string :name

      t.timestamps
    end
  end
end
