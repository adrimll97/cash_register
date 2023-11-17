# frozen_string_literal: true

class CreateFreePromotions < ActiveRecord::Migration[6.1]
  def change
    create_table :free_promotions do |t|
      t.integer :bougths_products
      t.integer :free_products

      t.timestamps
    end
  end
end
