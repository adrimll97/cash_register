# frozen_string_literal: true

class CreateProductPromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :product_promotions do |t|
      t.references :product, null: false, foreign_key: true
      t.references :promotionable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
