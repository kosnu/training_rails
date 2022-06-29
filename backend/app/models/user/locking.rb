# frozen_string_literal: true

class User::Locking < ApplicationRecord
  devise :lockable

  belongs_to :user
end
