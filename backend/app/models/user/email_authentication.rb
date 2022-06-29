# frozen_string_literal: true

class User::EmailAuthentication < ApplicationRecord
  devise :database_authenticatable, :validatable

  belongs_to :user

  private

  # @note ユーザー登録時はパスワードがない状態で登録するためメソッドを上書きしている
  def password_required?
    return false if user.registration.confirmed_at.nil?

    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
