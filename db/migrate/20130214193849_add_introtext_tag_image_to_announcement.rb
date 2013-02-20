class AddIntrotextTagImageToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :introtext, :string
    add_column :announcements, :tag, :string
    add_column :announcements, :image, :string
  end
end
