class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.references :sample, null: false, foreign_key: true
      t.references :lab_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
