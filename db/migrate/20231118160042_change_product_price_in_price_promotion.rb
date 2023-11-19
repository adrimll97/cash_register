class ChangeProductPriceInPricePromotion < ActiveRecord::Migration[6.1]
  def change
    remove_column :price_promotions, :product_price
    add_column :price_promotions, :product_discount, :string
  end
end
