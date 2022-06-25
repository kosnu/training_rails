# frozen_string_literal: true

class User < ApplicationRecord
  devise :authenticatable

  has_one :email_authentication, dependent: :destroy
  has_one :registration, dependent: :destroy
  has_one :password_reset, dependent: :destroy
  has_one :locking, dependent: :destroy
  has_one :tracking, dependent: :destroy
end
