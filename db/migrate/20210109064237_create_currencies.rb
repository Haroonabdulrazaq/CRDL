class CreateCurrencies < ActiveRecord::Migration[6.0]
  def change
    create_table :currencies do |t|
      t.string :currency

      t.timestamps
    end
    Currency.create do |c|
      c.currency = 'NGN'
    end
  end
end
