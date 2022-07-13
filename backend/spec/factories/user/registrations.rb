# frozen_string_literal: true

FactoryBot.define do
  factory :user_registration, class: 'User::Registration' do
    association :user
    confirmation_token do
      # Devise#friendly_token より
      length = (20 * 3) / 4
      SecureRandom.urlsafe_base64(length).tr('lIO0', 'sxyz')
    end
    confirmed_at { nil }
    unconfirmed_email { nil }
    email { user.email }
  end
end
