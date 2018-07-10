class UpdateColumns < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :name, :email
    add_column :users, :username, :string
  end
end
