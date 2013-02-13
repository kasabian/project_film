class RemoveVidjetCounterToSetting < ActiveRecord::Migration
  def up
    remove_column :settings, :vidjet
    remove_column :settings, :counter
  end

  def down
    add_column :settings, :counter, :string
    add_column :settings, :vidjet, :string
  end
end
