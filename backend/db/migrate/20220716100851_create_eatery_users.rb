# frozen_string_literal: true

class CreateEateryUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :eatery_users do |t|
      t.references :eatery, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
