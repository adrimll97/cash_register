# frozen_string_literal: true

class BasketProduct < ApplicationRecord
  belongs_to :product

  validates :product, :quantity, presence: true
  validates :product, uniqueness: true
  validates :quantity, numericality: true

  def calculate_price
    price_with_promotion = product.product_promotion&.apply_promotion(quantity)
    price_with_promotion || (product.price * quantity)
  end
end
