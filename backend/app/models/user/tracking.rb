# frozen_string_literal: true

class User
  class Tracking
    devise :trackable

    belongs_to :user
  end
end
