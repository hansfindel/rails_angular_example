class CreateMailUsers < ActiveRecord::Migration
  def change
    create_table :mail_users do |t|
      t.integer :user_id
      t.integer :mail_id

      t.timestamps
    end
  end
end
