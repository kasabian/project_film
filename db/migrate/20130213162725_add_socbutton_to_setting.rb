class AddSocbuttonToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :socbutton, :text
  end
end
