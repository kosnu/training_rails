# frozen_string_literal: true

class User
  class Registration
    devise :confirmable

    belongs_to :user
  end
end
