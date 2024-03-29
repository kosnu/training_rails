# frozen_string_literal: true

class CreateEateries < ActiveRecord::Migration[7.0]
  def change
    create_table :eateries do |t|
      t.string :name, null: false, default: ''
      t.string :address, null: true

      t.timestamps
    end
  end
end
