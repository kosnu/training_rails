# frozen_string_literal: true

class User
  class PasswordReset
    devise :recoverable

    belongs_to :user
  end
end
