class CreateBookmarktopics < ActiveRecord::Migration
  def change
    create_table :bookmarktopics do |t|
      t.references :bookmark, index: true
      t.references :topic, index: true
    end
  end
end
