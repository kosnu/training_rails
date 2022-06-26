# frozen_string_literal: true

class DeviseCreateUserTrackings < ActiveRecord::Migration[7.0]
  def change
    create_table :user_trackings do |t|
      t.references :user, foreign_key: true
      ## Trackable
      t.integer :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string :current_sign_in_ip
      t.string :last_sign_in_ip

      t.timestamps null: false
    end
  end
end
