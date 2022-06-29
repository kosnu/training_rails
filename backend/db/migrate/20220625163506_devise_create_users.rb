# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false, default: ''

      ## Rememberable
      # t.datetime :remember_created_at

      t.timestamps null: false
    end
  end
end
