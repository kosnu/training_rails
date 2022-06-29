# frozen_string_literal: true

class User::Tracking < ApplicationRecord
  devise :trackable

  belongs_to :user
end
