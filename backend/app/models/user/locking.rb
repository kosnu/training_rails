# frozen_string_literal: true

class User
  class Locking
    devise :lockable

    belongs_to :user
  end
end
