class AddThumbnailUrlToBookmarks < ActiveRecord::Migration
  def change
    add_column :bookmarks, :thumbnail_url, :string
  end
end
