# frozen_string_literal: true

class DeviseCreateUserLockings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_lockings do |t|
      t.references :users, foreign_key: true
      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      t.datetime :locked_at

      t.timestamps null: false
    end
  end
end
