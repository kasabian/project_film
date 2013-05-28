class AddVideoToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :video, :string
  end
end
