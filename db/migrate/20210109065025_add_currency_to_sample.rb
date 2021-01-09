class AddCurrencyToSample < ActiveRecord::Migration[6.0]
  def change
    add_column :samples, :currency_id, :integer
    add_foreign_key :samples, :currencies, column: :currency_id
  end
end
