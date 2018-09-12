class CreateVisits < ActiveRecord::Migration[5.1]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.integer :short_url_id
      t.timestamps
    end
    
    add_index :visits, :short_url_id
  end
end
