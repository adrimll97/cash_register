# frozen_string_literal: true

class PricePromotion < ApplicationRecord
  has_many :product_promotions, as: :promotionable

  validates :min_product_quantity, :product_price, presence: true
  validates :min_product_quantity, :product_price, numericality: true
end
