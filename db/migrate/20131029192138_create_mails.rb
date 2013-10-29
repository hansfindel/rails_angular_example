class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :text 

      t.timestamps
    end
  end
end
