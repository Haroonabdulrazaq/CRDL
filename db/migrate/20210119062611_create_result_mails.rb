class CreateResultMails < ActiveRecord::Migration[6.0]
  def change
    create_table :result_mails do |t|
      t.string :recipient_email
      t.string :email_object
      t.text :email_message
      t.references :user, null: false, foreign_key: true
      t.references :result, null: false, foreign_key: true

      t.timestamps
    end
  end
end
