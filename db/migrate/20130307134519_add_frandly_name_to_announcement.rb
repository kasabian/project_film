class AddFrandlyNameToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :frandly_name, :string
  end
end
