class AddVidjetCounteToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :vidjet, :text
    add_column :settings, :counter, :text
  end
end
