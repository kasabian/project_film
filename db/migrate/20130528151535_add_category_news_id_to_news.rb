class AddCategoryNewsIdToNews < ActiveRecord::Migration
  def change
    add_column :news, :category_news_id, :integer
  end
end
