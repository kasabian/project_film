class AddStatusToAd < ActiveRecord::Migration
  def change
    add_column :ads, :status, :boolean
  end
end
