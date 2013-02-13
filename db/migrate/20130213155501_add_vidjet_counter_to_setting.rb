class AddVidjetCounterToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :vidjet, :string
    add_column :settings, :counter, :string
  end
end
