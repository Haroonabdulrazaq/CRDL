class AddSampleIdToLabTest < ActiveRecord::Migration[6.0]
  def change
    add_column :lab_tests, :sample_id, :integer
    add_foreign_key :lab_tests, :samples, column: :sample_id
  end
end
