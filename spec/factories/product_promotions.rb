# frozen_string_literal: true

FactoryBot.define do
  factory :product_promotion do
    product { create(:product) }
    promotionable { nil }
  end
end
