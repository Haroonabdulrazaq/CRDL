class CreateSamples < ActiveRecord::Migration[6.0]
  def change
    create_table :samples do |t|
      t.text :name
      t.text :Address
      t.text :institution
      t.string :phone_num
      t.text :email
      t.text :supervisor_name
      t.text :supervisor_contact
      t.text :referrer
      t.text :current_status
      t.text :required_service
      t.text :description
      t.boolean :perishable
      t.number :retention_time
      t.date :result_due_date

      t.timestamps
    end
  end
end
