class CreateEmployees < ActiveRecord::Migration[6.1]
  def change
    create_table :employees do |t|
      t.string :email
      t.string :name
      t.string :position
      t.string :private_number
      t.boolean :active
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
