# frozen_string_literal: true

class UserForm < FormBase
  attr_accessor :user

  delegate :id, :persisted?, to: :user

  # @param [String] name
  # @param [String] email
  # @param [Hash] attributes
  # @param [User] user
  def initialize(name:, email:, attributes: nil, user: nil)
    @user = user || User.new(name:)
    @user.registration = user&.registration || User::Registration.new(email:, user: @user)
    @user.email_authentication = user&.email_authentication || User::EmailAuthentication.new(email:, user: @user)
    super(attributes:)
  end

  delegate :attributes=, to: :user, prefix: true

  private

  attr_reader :name

  def default_attributes
    {
      user:
    }
  end

  def persist
    raise ActiveRecord::RecordInvalid if user_invalid?(user)

    ActiveRecord::Base.transaction do
      save_user(user)
    end

    true
  rescue ActiveRecord::RecordInvalid
    errors_from_user
    errors_from_user_registration
    errors_from_user_email_authentication

    false
  end

  def errors_from_user
    user.errors.each do |error|
      errors.add(:base, error.full_message)
    end
  end

  def errors_from_user_registration
    user.registration.errors.each do |error|
      errors.add(:registration, error.full_message)
    end
  end

  def errors_from_user_email_authentication
    user.email_authentication.errors.each do |error|
      errors.add(:email_authentication, error.full_message)
    end
  end

  # ===========

  # @param [User] user
  def user_invalid?(user)
    user.invalid? && user.registration.invalid? && user.email_authentication.invalid?
  end

  # @param [User] user
  def save_user(user)
    user.save!
    user.registration.save!
    user.email_authentication.save!
  end
end
