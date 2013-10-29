class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.integer :points
      t.string :image_path

      t.timestamps
    end
  end
end
