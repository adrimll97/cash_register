# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    code { Faker::Lorem.word }
    name { Faker::Lorem.word }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
