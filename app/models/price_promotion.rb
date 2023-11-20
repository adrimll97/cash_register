# frozen_string_literal: true

class PricePromotion < ApplicationRecord
  has_many :product_promotions, as: :promotionable

  validates :min_product_quantity, :product_discount, presence: true
  validates :min_product_quantity, numericality: true

  def apply_promotion(product, quantity)
    return unless can_apply_promotion?(product, quantity)

    promotion_price = product.price * product_discount.to_r
    promotion_price * quantity
  end

  private

  def can_apply_promotion?(_product, quantity)
    quantity >= min_product_quantity
  end
end
