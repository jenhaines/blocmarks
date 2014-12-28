class RemoveTopicFromBookmarks < ActiveRecord::Migration
  def change
    remove_column :bookmarks, :topic, :string
  end
end
