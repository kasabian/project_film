class AddOrderToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :order, :boolean
  end
end
