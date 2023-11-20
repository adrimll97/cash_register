# frozen_string_literal: true

FactoryBot.define do
  factory :price_promotion do
    min_product_quantity { Faker::Number.number }
    product_discount { Faker::Number.between(from: 0.0, to: 1.0).to_s }
  end
end
