class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films do |t|
      t.string :name
      t.integer :year
      t.text :introtext
      t.string :role
      t.text :film

      t.timestamps
    end
  end
end
