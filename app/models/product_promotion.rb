# frozen_string_literal: true

class ProductPromotion < ApplicationRecord
  belongs_to :product
  belongs_to :promotionable, polymorphic: true

  validates :product, :promotionable, presence: true
end
