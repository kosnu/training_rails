# frozen_string_literal: true

class DeviseCreateUserPasswordResets < ActiveRecord::Migration[7.0]
  def change
    create_table :user_password_resets do |t|
      t.references :user, foreign_key: true
      ## Recoverable
      t.string :reset_password_token
      t.datetime :reset_password_sent_at

      t.timestamps null: false
    end

    add_index :user_password_resets, :reset_password_token, unique: true
  end
end
