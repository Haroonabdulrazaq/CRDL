# frozen_string_literal: true

class CreateLabTests < ActiveRecord::Migration[6.0]
  def change
    create_table :lab_tests do |t|
      t.string :title
      t.text :description
      t.float :price_per_unit
      t.references :users, null: false, foreign_key: true
      t.references :department_for_tests, null: false, foreign_key: true

      t.timestamps
    end
  end
end
