class AddCommentvkToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :commentvk, :text
  end
end
