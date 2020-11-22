class DropResultTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :results
  end
end