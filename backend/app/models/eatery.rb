# frozen_string_literal: true

class Eatery < ApplicationRecord
  has_many :eatery_users, dependent: :destroy
  has_many :users, through: :eatery_users
end
