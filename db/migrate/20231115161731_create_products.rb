class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :code
      t.string :name
      t.float :price

      t.timestamps
    end
    add_index :products, :code, unique: true
  end
end
