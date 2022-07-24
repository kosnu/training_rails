# frozen_string_literal: true

class EateryUser < ApplicationRecord
  belongs_to :eatery
  belongs_to :user
end
