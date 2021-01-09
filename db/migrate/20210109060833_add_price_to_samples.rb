# frozen_string_literal: true

class AddPriceToSamples < ActiveRecord::Migration[6.0]
  def change
    add_column :samples, :price_id, :integer
    add_foreign_key :samples, :prices, column: :price_id
  end
end
