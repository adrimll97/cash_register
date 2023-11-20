# frozen_string_literal: true

FactoryBot.define do
  factory :product_promotion do
    product { create(:product) }

    trait :free do
      promotionable { create(:free_promotion) }
    end

    trait :price do
      promotionable { create(:price_promotion) }
    end
  end
end
