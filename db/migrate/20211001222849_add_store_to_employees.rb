class AddStoreToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_reference :employees, :store, null: false, foreign_key: true
  end
end
