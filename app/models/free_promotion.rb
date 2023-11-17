# frozen_string_literal: true

class FreePromotion < ApplicationRecord
  has_many :product_promotions, as: :promotionable

  validates :bougths_products, :free_products, presence: true
  validates :bougths_products, :free_products, numericality: true
end
