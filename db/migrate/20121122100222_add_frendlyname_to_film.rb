class AddFrendlynameToFilm < ActiveRecord::Migration
  def change
    add_column :films, :frendlyname, :string
  end
end
