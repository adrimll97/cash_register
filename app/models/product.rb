# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :basket_product
  has_one :product_promotion

  validates :code, :name, :price, presence: true
  validates :code, uniqueness: true
  validates :price, numericality: true
end
