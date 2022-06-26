# frozen_string_literal: true

class User::PasswordReset < ApplicationRecord
  devise :recoverable

  belongs_to :user
end
