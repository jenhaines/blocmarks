class AddIndexToTopics < ActiveRecord::Migration
  def change
    add_index :topics, :topic, :unique => true
  end
end
