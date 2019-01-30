class CreateBookmarks < ActiveRecord::Migration[5.2]
  def change
    create_table :bookmarks do |t|
      t.boolean :is_enabled
      t.references :users, foreign_key: true
      t.references :articles, foreign_key: true

      t.timestamps
    end
  end
end
