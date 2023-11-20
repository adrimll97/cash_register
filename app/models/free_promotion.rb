# frozen_string_literal: true

class FreePromotion < ApplicationRecord
  has_many :product_promotions, as: :promotionable

  validates :bougths_products, :free_products, presence: true
  validates :bougths_products, :free_products, numericality: true

  def apply_promotion(product, quantity)
    return unless can_apply_promotion?(product, quantity)

    quantity_to_pay = ((quantity.to_f / (bougths_products + free_products)) * bougths_products).ceil
    product.price * quantity_to_pay
  end

  private

  def can_apply_promotion?(_product, quantity)
    quantity >= bougths_products
  end
end
