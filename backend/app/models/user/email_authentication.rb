# frozen_string_literal: true

class User
  class EmailAuthentication < ApplicationRecord
    devise :database_authenticatable, :validatable

    belongs_to :user
  end
end
