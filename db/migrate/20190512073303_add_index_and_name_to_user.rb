class AddIndexAndNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_index :users, :contact, unique: true
    add_index :users, :std_number, unique: true
  end
end
