class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :contact, :string
    add_column :users, :std_number, :string
  end
end
