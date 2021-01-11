class CreatePrices < ActiveRecord::Migration[6.0]
  def change
    create_table :prices do |t|
      t.references :sample, null: false, foreign_key: true
      t.string :lab_tests

      t.timestamps
    end
  end
end
