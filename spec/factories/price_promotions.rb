# frozen_string_literal: true

FactoryBot.define do
  factory :price_promotion do
    min_product_quantity { Faker::Number.number }
    product_price { Faker::Number.decimal(l_digits: 2) }
  end
end
