class AddUserIdToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :my_id, :string
    add_index :users, :my_id, unique: true
  end
end
