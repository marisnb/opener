class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :name
      t.string :image_path
      t.string :description

      t.timestamps
    end
  end
end
