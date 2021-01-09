class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.float :price, null: false, default: 0.0

      t.timestamps
    end
  end
end
