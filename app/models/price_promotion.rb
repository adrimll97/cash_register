# frozen_string_literal: true

class PricePromotion < ApplicationRecord
  has_many :product_promotions, as: :promotionable

  validates :min_product_quantity, :product_discount, presence: true
  validates :min_product_quantity, numericality: true
end
