class AddTagToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :tag, :integer
  end
end
