# frozen_string_literal: true

class CreateLabTests < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_tests do |t|
      t.string :title
      t.text :description
      t.integer :quantity
      t.float :price_per_unit
      t.references :user, null: false, foreign_key: true
      t.references :department_for_test, null: false, foreign_key: true

      t.timestamps
    end
  end
end
