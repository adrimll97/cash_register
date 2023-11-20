# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    sequence(:code) { |n| "#{Faker::Lorem.word}#{n}" }
    name { Faker::Lorem.word }
    price { Faker::Number.decimal(l_digits: 2) }
  end
end
