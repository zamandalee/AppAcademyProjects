class EnforcePresence < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :username
    add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end
end
