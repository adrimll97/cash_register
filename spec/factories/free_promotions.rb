# frozen_string_literal: true

FactoryBot.define do
  factory :free_promotion do
    bougths_products { Faker::Number.number }
    free_products { Faker::Number.number }
  end
end
