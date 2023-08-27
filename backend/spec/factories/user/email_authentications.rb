# frozen_string_literal: true

FactoryBot.define do
  factory :user_email_authentication, class: 'User::EmailAuthentication' do
    user
    sequence(:email) { |n| "test-#{n}@example.com" }
    password { 'test' }
    password_confirmation { 'test' }
  end
end
