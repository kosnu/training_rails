# frozen_string_literal: true

class User::Registration < ApplicationRecord
  devise :confirmable

  belongs_to :user
end
