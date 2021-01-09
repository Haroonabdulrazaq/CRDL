# frozen_string_literal: true

class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.float :Tv
      t.float :Ws
      t.boolean :proteinrich
      t.float :Wsc
      t.float :Wca
      t.float :Abs
      t.float :T
      t.float :DO5
      t.float :DO1
      t.float :DABSsample
      t.float :DABSstd
      t.float :Bsap
      t.float :Ssap
      t.float :Nsap
      t.float :Wsap
      t.float :Va
      t.float :Na
      t.float :Wa
      t.float :bi
      t.float :Si
      t.float :Ni
      t.float :Wi
      t.float :Vp
      t.float :Np
      t.references :sample, null: false, foreign_key: true

      t.timestamps
    end
  end
end
