# frozen_string_literal: true

FactoryBot.define do
  factory :eatery do
    sequence(:name) { |n| "EateryName_#{n}" }
    address { nil }
  end
end
