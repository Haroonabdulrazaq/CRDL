# frozen_string_literal: true

class CreateDepartmentForTests < ActiveRecord::Migration[6.0]
  def change
    create_table :department_for_tests do |t|
      t.string :title
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
