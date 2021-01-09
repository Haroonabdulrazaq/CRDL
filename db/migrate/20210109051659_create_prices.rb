# frozen_string_literal: true

class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.float :price, null: false, default: 0.0

      t.timestamps
    end

    Price.create do |p|
      p.price = 100
    end
  end
end
