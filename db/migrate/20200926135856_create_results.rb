class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.integer :Tv
      t.integer :Ws
      t.boolean :proteinrich
      t.integer :Wsc
      t.integer :Wca
      t.integer :Abs
      t.integer :T
      t.integer :DO5
      t.integer :DO1
      t.integer :DABSsample
      t.integer :DABSstd
      t.references :sample, null: false, foreign_key: true

      t.timestamps
    end
  end
end
