# frozen_string_literal: true

class DeviseCreateUserEmailAuthentications < ActiveRecord::Migration[7.0]
  def change
    create_table :user_email_authentications do |t|
      t.references :users, foreign_key: true
      ## Database authenticatable
      t.string :email, null: false, default: ''
      t.string :encrypted_password, null: false, default: ''

      t.timestamps null: false
    end

    add_index :user_email_authentications, :email, unique: true
  end
end
