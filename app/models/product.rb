# frozen_string_literal: true

class Product < ApplicationRecord
  has_one :basket_product

  validates :code, :name, :price, presence: true
  validates :code, uniqueness: true
  validates :price, numericality: true
end
