class CreateBasketProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :basket_products do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
