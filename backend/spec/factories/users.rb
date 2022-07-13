# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "UserName_#{n}" }

    trait :confirming do
      after(:build) do |user|
        user.email_authentication = build(:user_email_authentication, user:, password: '', password_confirmation: '')
        user.registration = build(:user_registration, user:)
      end
    end

    trait :confirmed do
      after(:build) do |user|
        user.email_authentication = build(:user_email_authentication, user:)
      end
    end
  end
end
