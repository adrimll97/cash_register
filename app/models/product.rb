# frozen_string_literal: true

class Product < ApplicationRecord
  validates :code, :name, :price, presence: true
  validates :code, uniqueness: true
  validates :price, numericality: true
end
