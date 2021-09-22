class CreateRelojs < ActiveRecord::Migration[6.1]
  def change
    create_table :relojs do |t|
      t.string :name

      t.timestamps
    end
  end
end
