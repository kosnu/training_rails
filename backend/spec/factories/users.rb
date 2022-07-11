# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:name) { |n| "UserName_#{n}" }

    after(:build) do |user|
      user.email_authentication = build(:user_email_authentication, user:)
      user.registration = build(:user_registration, user:)
    end
  end
end
