class AddIsEnabledToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_enabled, :boolean
  end
end
