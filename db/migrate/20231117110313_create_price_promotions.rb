# frozen_string_literal: true

class CreatePricePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :price_promotions do |t|
      t.integer :min_product_quantity
      t.float :product_price

      t.timestamps
    end
  end
end
