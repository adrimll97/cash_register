# frozen_string_literal: true

FactoryBot.define do
  factory :basket_product do
    product { create(:product) }
    quantity { Faker::Number.number }
  end
end
