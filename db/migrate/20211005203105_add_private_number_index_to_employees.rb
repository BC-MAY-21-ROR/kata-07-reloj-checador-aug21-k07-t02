class AddPrivateNumberIndexToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_index :employees, :private_number, unique: true
  end
end
