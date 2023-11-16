# frozen_string_literal: true

class BasketProduct < ApplicationRecord
  belongs_to :product

  validates :product, :quantity, presence: true
  validates :product, uniqueness: true
  validates :quantity, numericality: true
end
